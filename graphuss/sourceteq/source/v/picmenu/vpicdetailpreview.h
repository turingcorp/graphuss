#import "appdel.h"

@class vpicdetail;

@interface vpicdetailpreview:UIView

-(instancetype)init:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;
@property(weak, nonatomic)UIScrollView *scroll;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)NSLayoutConstraint *conimagetop;
@property(weak, nonatomic)NSLayoutConstraint *conimageleft;
@property(weak, nonatomic)NSLayoutConstraint *conimagewidth;
@property(weak, nonatomic)NSLayoutConstraint *conimageheight;

@end