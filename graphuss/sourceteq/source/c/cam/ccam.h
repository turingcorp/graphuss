#import "appdel.h"

@class vcam;

@interface ccam:UIViewController

-(void)shoot;
-(void)detaillastpic;
-(void)changefocus:(CGFloat)amount;
-(void)changeduration:(CGFloat)duration iso:(CGFloat)iso;

@property(weak, nonatomic)vcam *cam;
@property(strong, nonatomic)AVCaptureSession *session;
@property(strong, nonatomic)AVCaptureDevice *device;
@property(strong, nonatomic)AVCaptureStillImageOutput *output;

@end