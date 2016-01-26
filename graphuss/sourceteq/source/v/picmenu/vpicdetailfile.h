#import "appdel.h"

@class vpicdetail;

@interface vpicdetailfile:UIView

-(instancetype)init:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;

@end