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
    [self.preview setFrame:self.bounds];
    [super layoutSubviews];
}

#pragma mark public

-(void)startsession:(AVCaptureSession*)session
{
    [self.preview removeFromSuperlayer];
    AVCaptureVideoPreviewLayer *preview = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [preview.connection setVideoOrientation:AVCaptureVideoOrientationLandscapeLeft];
    [preview setVideoGravity:AVLayerVideoGravityResizeAspect];
    self.preview = preview;
    [self.layer addSublayer:preview];
}

@end