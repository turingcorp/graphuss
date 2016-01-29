#import "appdel.h"

@class vpicdetailfilters;

@interface vpicdetailfiltersbw:UIView

-(instancetype)init:(vpicdetailfilters*)filters;

@property(weak, nonatomic)vpicdetailfilters *filters;

@end