#import "appdel.h"

@class vcam;

@interface vcammenu:UIView

-(instancetype)init:(vcam*)viewcam;

@property(weak, nonatomic)vcam *viewcam;
@property(weak, nonatomic)NSLayoutConstraint *coshootleft;
@property(weak, nonatomic)UIButton *btnshoot;
@property(weak, nonatomic)UIButton *btnfilters;

@end