#import "appdel.h"

@class mcamitem;

@interface mcamflash:NSObject

-(NSUInteger)count;
-(mcamitem*)item:(NSUInteger)index;

@end