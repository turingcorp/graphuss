#import "appdel.h"
#import "mpicmenufiltersprotocol.h"

@interface mpicmenufilterscolor:NSObject<mpicmenufiltersprotocol>

-(NSInteger)count;
-(id)item:(NSInteger)index;

@end