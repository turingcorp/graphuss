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
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
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
    }
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

#pragma mark public

-(void)shoot
{
    [[analytics singleton] trackevent:ga_event_shoot action:ga_action_shoot label:nil];
    
    dispatch_async(queue,
                   ^
                   {
                       [self insideshoot];
                   });
}

@end