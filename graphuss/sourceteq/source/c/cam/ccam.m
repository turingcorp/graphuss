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
        [session startRunning];
    }
}

@end