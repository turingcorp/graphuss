#import "appdel.h"

@class vpicdetail;

@interface vpicdetailpreview:UIView

-(instancetype)init:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;
@property(weak, nonatomic)UIScrollView *scroll;
@property(weak, nonatomic)UIImageView *image;

@end