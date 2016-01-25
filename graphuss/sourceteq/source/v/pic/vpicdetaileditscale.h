#import "appdel.h"

@class vpicdetail;

@interface vpicdetaileditscale:UIView

+(void)askscale:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;

@end