#import "appdel.h"
#import "mconfigprotocol.h"

@interface mconfig:NSObject

-(NSUInteger)count;
-(id<mconfigprotocol>)item:(NSUInteger)index;

@end