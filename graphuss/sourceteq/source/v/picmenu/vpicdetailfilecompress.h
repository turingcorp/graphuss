#import "appdel.h"

@class vpicdetail;

@interface vpicdetailfilecompress:UIView

-(instancetype)init:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;

@end