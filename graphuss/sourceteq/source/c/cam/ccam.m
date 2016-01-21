#import "ccam.h"

@implementation ccam

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    if(!self.cam)
    {
        self.cam = (vcam*)self.view;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 300), dispatch_get_main_queue(),
                       ^
                       {
                           [self auth];
                       });
    }
}

-(void)loadView
{
    self.view = [[vcam alloc] init:self];
}

#pragma mark functionality

-(void)auth
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:
     ^(BOOL granted)
     {
         if(granted)
         {
             dispatch_async(dispatch_get_main_queue(),
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
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetPhoto;
    
    [self.cam addfinder:session];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    if(error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    else if(!input)
    {
        NSLog(@"%@", NSLocalizedString(@"error_empty_input", nil));
    }
    else
    {
        [session addInput:input];
        
        AVCaptureStillImageOutput *output = [[AVCaptureStillImageOutput alloc] init];
        [output setOutputSettings:@{AVVideoCodecKey:AVVideoCodecJPEG}];
        [session addOutput:output];
        [session startRunning];/*
        
        if(applicationtype == apptypepad)
        {
            AVCaptureConnection *con = [output connectionWithMediaType:AVMediaTypeVideo];
            
            if(con.supportsVideoOrientation)
            {
                dispatch_async(dispatch_get_main_queue(),
                               ^(void)
                               {
                                   [con setVideoOrientation:orientation];
                                   [previewlayer.connection setVideoOrientation:orientation];
                               });
            }
        }
        
        if(applicationios != ioslevel7)
        {
            if([device lockForConfiguration:nil])
            {
                __weak modcapture *stats = master.stats;
                __weak AVCaptureDeviceFormat *active = device.activeFormat;
                
                [device setFocusModeLockedWithLensPosition:stats.focusposition completionHandler:nil];
                [device setExposureModeCustomWithDuration:[stats exposurefor:active.maxExposureDuration and:active.minExposureDuration] ISO:[stats isofor:active.maxISO and:active.minISO] completionHandler:nil];
                [device setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:[stats gains:device.deviceWhiteBalanceGains max:device.maxWhiteBalanceGain] completionHandler:nil];
                [device unlockForConfiguration];
            }
        }*/
    }
}

@end