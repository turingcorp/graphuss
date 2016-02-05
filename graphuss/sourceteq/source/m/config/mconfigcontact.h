#import "appdel.h"
#import "mconfigprotocol.h"
#import "mconfigcontactprotocol.h"

@interface mconfigcontact:NSObject<mconfigprotocol>

-(NSUInteger)count;
-(id<mconfigcontactprotocol>)item:(NSUInteger)index;

@end