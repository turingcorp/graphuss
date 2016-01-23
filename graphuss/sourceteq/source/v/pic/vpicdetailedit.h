#import "appdel.h"

@class vpicdetail;

@interface vpicdetailedit:UIView

-(instancetype)init:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;

@end