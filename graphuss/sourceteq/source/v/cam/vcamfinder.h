#import "appdel.h"

@interface vcamfinder:UIView

-(instancetype)init:(AVCaptureSession*)session;

@property(weak, nonatomic)AVCaptureVideoPreviewLayer *preview;

@end