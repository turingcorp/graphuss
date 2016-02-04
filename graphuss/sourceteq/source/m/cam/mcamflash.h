#import "appdel.h"

@class mcamflashitem;

@interface mcamflash:NSObject

-(NSUInteger)count;
-(mcamflashitem*)item:(NSUInteger)index;
-(void)selectflash:(NSUInteger)item;

@property(nonatomic)NSUInteger selected;

@end