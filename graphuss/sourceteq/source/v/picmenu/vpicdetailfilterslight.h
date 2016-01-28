#import "appdel.h"

@class vpicdetailfilters;

@interface vpicdetailfilterslight:UIView

-(instancetype)init:(vpicdetailfilters*)filters;

@property(weak, nonatomic)vpicdetailfilters *filters;
@property(weak, nonatomic)UISlider *slider;
@property(weak, nonatomic)UIButton *button;
@property(weak, nonatomic)UIImageView *preview;
@property(weak, nonatomic)UIImage *baseimage;
@property(weak, nonatomic)UILabel *label;

@end