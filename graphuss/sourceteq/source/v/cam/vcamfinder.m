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
}

@end