#import "vcamfinder.h"

@implementation vcamfinder

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.preview setFrame:self.bounds];
}

#pragma mark public

-(void)startsession:(AVCaptureSession*)session
{
    [self.preview removeFromSuperlayer];
    AVCaptureVideoPreviewLayer *preview = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [preview setVideoGravity:AVLayerVideoGravityResizeAspect];
    self.preview = preview;
    [self.layer addSublayer:preview];
    
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        AVCaptureConnection *con = self.preview.connection;
        
        AVCaptureVideoOrientation orientation;
        
        switch([cmain singleton].interfaceOrientation)
        {
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationUnknown:
                
                orientation = AVCaptureVideoOrientationPortrait;
                
                break;
                
            case UIInterfaceOrientationPortraitUpsideDown:
                
                orientation = AVCaptureVideoOrientationPortraitUpsideDown;
                
                break;
                
            case UIInterfaceOrientationLandscapeLeft:
                
                orientation = AVCaptureVideoOrientationLandscapeLeft;
                
                break;
                
            case UIInterfaceOrientationLandscapeRight:
                
                orientation = AVCaptureVideoOrientationLandscapeRight;
                
                break;
        }
        
        dispatch_async(dispatch_get_main_queue(),
                       ^(void)
                       {
                           [con setVideoOrientation:orientation];
                       });
    }
}

@end