#import "appdel.h"
#import "mconfigprotocol.h"
#import "mconfiglibraryprotocol.h"

@interface mconfiglibrary:NSObject<mconfigprotocol>

-(NSUInteger)count;
-(id<mconfiglibraryprotocol>)item:(NSUInteger)index;

@end