#import "appdel.h"

@interface vcamfinder:UIView

-(void)startsession:(AVCaptureSession*)session;

@property(weak, nonatomic)AVCaptureVideoPreviewLayer *preview;

@end