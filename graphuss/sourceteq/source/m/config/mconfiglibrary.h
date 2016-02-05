#import "appdel.h"
#import "mconfigprotocol.h"

@interface mconfiglibrary:NSObject<mconfigprotocol>

-(NSUInteger)count;
-(id)item:(NSUInteger)index;

@end