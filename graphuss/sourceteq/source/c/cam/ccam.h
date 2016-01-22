#import "appdel.h"

@class vcam;

@interface ccam:UIViewController

@property(weak, nonatomic)vcam *cam;
@property(strong, nonatomic)AVCaptureSession *session;

@end