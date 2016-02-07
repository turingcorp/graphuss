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
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.preview setFrame:self.bounds];
                   });
    
    [super layoutSubviews];
}

#pragma mark public

-(void)startsession:(AVCaptureSession*)session
{
    [self.preview removeFromSuperlayer];
    AVCaptureVideoPreviewLayer *preview = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [preview setVideoGravity:AVLayerVideoGravityResizeAspect];
    self.preview = preview;
    [self.layer addSublayer:preview];
    
#warning "asd"
}

@end