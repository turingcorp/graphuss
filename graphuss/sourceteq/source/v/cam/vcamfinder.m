#import "vcamfinder.h"

@implementation vcamfinder

-(instancetype)init:(AVCaptureSession*)session
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    AVCaptureVideoPreviewLayer *preview = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [preview setVideoGravity:AVLayerVideoGravityResizeAspect];
    self.preview = preview;
    [self.layer addSublayer:preview];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    [self.preview setFrame:CGRectMake(0, 0, width, width * 4.0 / 3.0)];
}

@end