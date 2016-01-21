#import "appdel.h"
#import "viewbase.h"

@class vcamfinder;

@interface vcam:viewbase

-(void)addfinder:(AVCaptureSession*)session;

@property(weak, nonatomic)vcamfinder *finder;

@end