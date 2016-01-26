#import "appdel.h"

@class vpicdetail;

@interface vpicdetailfilecompress:UIView

-(instancetype)init:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;
@property(weak, nonatomic)UISlider *slider;
@property(weak, nonatomic)UILabel *labelvalue;

@end