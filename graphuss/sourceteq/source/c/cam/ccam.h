#import "appdel.h"

@class vcam;
@class mcamiso;

@interface ccam:UIViewController

-(void)shoot;
-(void)detaillastpic;
-(void)focus:(BOOL)automatic amount:(CGFloat)amount;
-(void)exposure:(BOOL)automatic duration:(CGFloat)duration iso:(CGFloat)iso;
-(void)flashtype:(cam_flash)flashtype;

@property(weak, nonatomic)vcam *cam;
@property(strong, nonatomic)mcamiso *isos;
@property(strong, nonatomic)AVCaptureSession *session;
@property(strong, nonatomic)AVCaptureDevice *device;
@property(strong, nonatomic)AVCaptureStillImageOutput *output;
@property(nonatomic)AVCaptureVideoOrientation orientation;
@property(nonatomic)UIImageOrientation imageorientation;

@end