#import "appdel.h"
#import "viewbase.h"

@class vcamfinder;
@class vspinner;
@class vcammenu;
@class vcampreview;
@class vcammenuoptions;

@interface vcam:viewbase

-(void)addfinder:(AVCaptureSession*)session;
-(void)takepicture;
-(void)picturetaken:(UIImage*)image;
-(void)restart;

@property(weak, nonatomic)vcamfinder *finder;
@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)vcammenu *menu;
@property(weak, nonatomic)vcampreview *preview;
@property(weak, nonatomic)vcammenuoptions *options;
@property(weak, nonatomic)NSLayoutConstraint *comenuheight;
@property(weak, nonatomic)NSLayoutConstraint *cofinderheight;
@property(weak, nonatomic)NSLayoutConstraint *copreviewheight;
@property(weak, nonatomic)NSLayoutConstraint *copreviewmargin;

@end