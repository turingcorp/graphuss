#import "appdel.h"
#import "viewbase.h"

@class vcamfinder;
@class vspinner;

@interface vcam:viewbase

-(void)addfinder:(AVCaptureSession*)session;

@property(weak, nonatomic)vcamfinder *finder;
@property(weak, nonatomic)vspinner *spinner;

@end