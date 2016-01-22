#import "appdel.h"
#import "viewbase.h"

@class vcamfinder;
@class vspinner;
@class vcammenu;
@class vcampreview;

@interface vcam:viewbase

-(void)addfinder:(AVCaptureSession*)session;
-(void)picturetaken:(UIImage*)image;

@property(weak, nonatomic)vcamfinder *finder;
@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)vcammenu *menu;
@property(weak, nonatomic)vcampreview *preview;
@property(weak, nonatomic)NSLayoutConstraint *comenuheight;
@property(weak, nonatomic)NSLayoutConstraint *copreviewheight;

@end