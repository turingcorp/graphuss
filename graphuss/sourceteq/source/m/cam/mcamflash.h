#import "appdel.h"

@class mcamflashitem;

@interface mcamflash:NSObject

-(NSUInteger)count;
-(mcamflashitem*)item:(NSUInteger)index;

@end