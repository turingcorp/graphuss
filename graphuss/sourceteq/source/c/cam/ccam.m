#import "ccam.h"

@implementation ccam
{
    dispatch_queue_t queue;
}

-(instancetype)init
{
    self = [super init];
    
    queue = dispatch_queue_create(@"capture".UTF8String, DISPATCH_QUEUE_SERIAL);
    dispatch_set_target_queue(queue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0));
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    [[analytics singleton] trackscreen:ga_screen_camera];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self cleanup];
}

-(void)viewDidAppear:(BOOL)animated
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 300), dispatch_get_main_queue(),
                   ^
                   {
                       [self auth];
                   });
}

-(void)loadView
{
    self.view = [[vcam alloc] init:self];
    self.cam = (vcam*)self.view;
}

#pragma mark functionality

-(void)error:(NSString*)error
{
    [[analytics singleton] trackevent:ga_event_shoot action:ga_action_error label:error];
    NSLog(@"%@", error);
}

-(void)cleanup
{
    [self.session stopRunning];
    self.session = nil;
}

-(void)auth
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:
     ^(BOOL granted)
     {
         if(granted)
         {
             dispatch_async(queue,
                            ^
                            {
                                [self startsession];
                            });
         }
         else
         {
             [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
             [[analytics singleton] trackevent:ga_event_shoot action:ga_action_error label:NSLocalizedString(@"error_notauthorized", nil)];
             [valert alert:NSLocalizedString(@"error_notauthorized", nil) inview:self.view];
         }
     }];
}

-(void)startsession
{
    [[analytics singleton] trackevent:ga_event_shoot action:ga_action_start label:nil];
    
    self.session = [[AVCaptureSession alloc] init];
    self.session.sessionPreset = AVCaptureSessionPresetPhoto;
    
    [self.cam addfinder:self.session];
    
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:&error];
    
    if(error)
    {
        [self error:error.localizedDescription];
    }
    else if(!input)
    {
        [self error:NSLocalizedString(@"error_empty_input", nil)];
    }
    else
    {
        [self.session addInput:input];
        
        self.output = [[AVCaptureStillImageOutput alloc] init];
        [self.output setOutputSettings:@{AVVideoCodecKey:AVVideoCodecJPEG}];
        [self.session addOutput:self.output];
        [self.session startRunning];
        
        [self initialconfiguration];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
}

-(void)insideshoot
{
    [self.output captureStillImageAsynchronouslyFromConnection:[self.output connectionWithMediaType:AVMediaTypeVideo] completionHandler:
     ^(CMSampleBufferRef buffer, NSError *error)
     {
         if(error)
         {
             [self error:error.localizedDescription];
         }
         else if(!buffer)
         {
             [self error:NSLocalizedString(@"error_wrongbuffer", nil)];
         }
         else
         {
             NSData *data = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:buffer];
             
             if(data && data.length)
             {
                 UIImage *image = [[UIImage alloc] initWithData:data];
                 
                 if(image)
                 {
                     [self picreceived:image];
                 }
                 else
                 {
                     [self error:NSLocalizedString(@"error_emptypicture", nil)];
                 }
             }
             else
             {
                 [self error:NSLocalizedString(@"error_emptypicture", nil)];
             }
         }
     }];
}

-(void)picreceived:(UIImage*)image
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [self.cam picturetaken:image];
                       [self restarttimeout];
                       
                       if([[mpic singleton] savepic:image])
                       {
                           [[analytics singleton] trackevent:ga_event_shoot action:ga_action_completed label:nil];
                       }
                   });
}

-(void)restarttimeout
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(timeout:) userInfo:nil repeats:NO];
                   });
}

-(void)timeout:(NSTimer*)timer
{
    [timer invalidate];
    [self.cam restart];
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
}

-(void)initialconfiguration
{
    [self insidefocus:[mcamsettings singleton].focusautomatic amount:[mcamsettings singleton].focusamount];
    [self insideexposure:[mcamsettings singleton].exposureautomatic duration:[mcamsettings singleton].exposureduration iso:[mcamsettings singleton].exposureiso];
    [self insideflashtype:[mcamsettings singleton].flashtype];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       self.isos = [[mcamiso alloc] init:self.device];
                       [[NSNotificationCenter defaultCenter] postNotificationName:notreloadisos object:nil];
                   });
}

-(void)insidefocus:(BOOL)automatic amount:(CGFloat)amount
{
    __weak ccam *weakself = self;
    
    dispatch_async(queue,
                   ^
                   {
                       NSError *error;
                       
                       if([weakself.device lockForConfiguration:&error])
                       {
                           if(automatic)
                           {
                               [weakself.device setFocusMode:AVCaptureFocusModeContinuousAutoFocus];
                           }
                           else
                           {
                               if([weakself.device respondsToSelector:@selector(setFocusModeLockedWithLensPosition:completionHandler:)])
                               {
                                   [weakself.device setFocusModeLockedWithLensPosition:amount completionHandler:nil];
                               }
                               else
                               {
                                   [weakself.device setFocusMode:AVCaptureFocusModeAutoFocus];
                               }
                           }
                           
                           [weakself.device unlockForConfiguration];
                       }
                       else
                       {
                           if(error)
                           {
                               NSLog(@"focus error: %@", error.localizedDescription);
                               [[analytics singleton] trackevent:ga_event_cam_focus action:ga_action_error label:error.localizedDescription];
                           }
                       }
                   });
}

-(void)insideexposure:(BOOL)automatic duration:(CGFloat)duration iso:(CGFloat)iso
{
    __weak ccam *weakself = self;
    
    dispatch_async(queue,
                   ^
                   {
                       NSError *error;
                       
                       if([weakself.device lockForConfiguration:&error])
                       {
                           if(automatic)
                           {
                               [weakself.device setExposureMode:AVCaptureExposureModeContinuousAutoExposure];
                           }
                           else
                           {
                               if([weakself.device respondsToSelector:@selector(setExposureModeCustomWithDuration:ISO:completionHandler:)])
                               {
                                   [weakself.device setExposureModeCustomWithDuration:[self exposuredurationfor:duration] ISO:iso completionHandler:nil];
                               }
                               else
                               {
                                   [weakself.device setExposureMode:AVCaptureExposureModeAutoExpose];
                               }
                           }
                           
                           [weakself.device unlockForConfiguration];
                       }
                       else
                       {
                           if(error)
                           {
                               NSLog(@"exposure error: %@", error.localizedDescription);
                               [[analytics singleton] trackevent:ga_event_cam_exposure action:ga_action_error label:error.localizedDescription];
                           }
                       }
                   });
}

-(void)insideflashtype:(cam_flash)flashtype
{
    __weak ccam *weakself = self;
    
    dispatch_async(queue,
                   ^
                   {
                       NSError *error;
                       __weak AVCaptureDevice *device = weakself.device;
                       
                       if([device lockForConfiguration:&error])
                       {
                           if(flashtype == cam_flash_torch)
                           {
                               if(device.hasFlash)
                               {
                                   if(device.flashAvailable)
                                   {
                                       if([device isFlashModeSupported:AVCaptureFlashModeOff])
                                       {
                                           [device setFlashMode:AVCaptureFlashModeOff];
                                       }
                                   }
                               }
                               
                               if(device.hasTorch)
                               {
                                   if(device.torchAvailable)
                                   {
                                       if([device isTorchModeSupported:AVCaptureTorchModeOn])
                                       {
                                           [device setTorchMode:AVCaptureTorchModeOn];
                                       }
                                       else
                                       {
                                           [self flasherror:NSLocalizedString(@"cam_flash_error_torchnotsupported", nil)];
                                       }
                                   }
                                   else
                                   {
                                       [self flasherror:NSLocalizedString(@"cam_flash_error_torchnotavailable", nil)];
                                   }
                               }
                               else
                               {
                                   [self flasherror:NSLocalizedString(@"cam_flash_error_notorch", nil)];
                               }
                           }
                           else
                           {
                               if(device.hasTorch)
                               {
                                   if(device.torchAvailable)
                                   {
                                       if([device isTorchModeSupported:AVCaptureTorchModeOff])
                                       {
                                           [device setTorchMode:AVCaptureTorchModeOff];
                                       }
                                   }
                               }
                               
                               if(device.hasFlash)
                               {
                                   if(device.flashAvailable)
                                   {
                                       AVCaptureFlashMode mode;
                                       NSString *possibleerror;
                                       
                                       switch(flashtype)
                                       {
                                            case cam_flash_off:
                                               
                                               mode = AVCaptureFlashModeOff;
                                               possibleerror = NSLocalizedString(@"cam_flash_error_flashoffnotsupported", nil);
                                               
                                               break;
                                               
                                            case cam_flash_auto:
                                               
                                               mode = AVCaptureFlashModeAuto;
                                               possibleerror = NSLocalizedString(@"cam_flash_error_flashautonotsupported", nil);
                                               
                                               break;
                                               
                                            case cam_flash_on:
                                               
                                               mode = AVCaptureFlashModeOn;
                                               possibleerror = NSLocalizedString(@"cam_flash_error_flashonnotsupported", nil);
                                               
                                               break;
                                               
                                            default:
                                               
                                               possibleerror = @"";
                                               
                                               break;
                                       }
                                       
                                       if([device isFlashModeSupported:mode])
                                       {
                                           [device setFlashMode:mode];
                                       }
                                       else
                                       {
                                           [self flasherror:possibleerror];
                                       }
                                   }
                                   else
                                   {
                                       [self flasherror:NSLocalizedString(@"cam_flash_error_flashnotavailable", nil)];
                                   }
                               }
                               else
                               {
                                   [self flasherror:NSLocalizedString(@"cam_flash_error_noflash", nil)];
                               }
                           }
                           
                           [device unlockForConfiguration];
                       }
                       else
                       {
                           if(error)
                           {
                               [self flasherror:error.localizedDescription];
                           }
                       }
                   });
}

-(void)flasherror:(NSString*)error
{
    NSLog(@"flash error: %@", error);
    [[analytics singleton] trackevent:ga_event_cam_flash action:ga_action_error label:error];
}

-(CMTime)exposuredurationfor:(CGFloat)duration
{
    AVCaptureDeviceFormat *format = self.device.activeFormat;
    CMTime minduration = format.minExposureDuration;
    CMTime maxduration = format.maxExposureDuration;
    CMTime rangeduration = CMTimeSubtract(maxduration, minduration);
    CMTime relative = CMTimeMultiplyByFloat64(rangeduration, duration);
    CMTime current = CMTimeAdd(minduration, relative);
    
    return current;
}

#pragma mark public

-(void)shoot
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    
    [[analytics singleton] trackevent:ga_event_shoot action:ga_action_shoot label:nil];
    
    dispatch_async(queue,
                   ^
                   {
                       [self insideshoot];
                   });
}

-(void)detaillastpic
{
    NSInteger count = [[mpic singleton] count];
    
    if(count)
    {
        mpicitem *pic = [[mpic singleton] item:0];
        [[cmain singleton] pushViewController:[[cpicdetail alloc] init:pic] animated:YES];
    }
}

-(void)focus:(BOOL)automatic amount:(CGFloat)amount
{
    [[mcamsettings singleton] focusauto:automatic amount:amount];
    [self insidefocus:automatic amount:amount];
}

-(void)exposure:(BOOL)automatic duration:(CGFloat)duration iso:(CGFloat)iso
{
    [[mcamsettings singleton] exposureauto:automatic duration:duration iso:iso];
    [self insideexposure:automatic duration:duration iso:iso];
}

-(void)flashtype:(cam_flash)flashtype
{
    [[mcamsettings singleton] flashtype:flashtype];
    [self insideflashtype:flashtype];
}

@end