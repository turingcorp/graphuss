#import "appdel.h"
#import "mpicmenufiltersprotocol.h"
#import "mpicmenufilterscolorprotocol.h"

@interface mpicmenufilterscolor:NSObject<mpicmenufiltersprotocol>

-(NSInteger)count;
-(id<mpicmenufilterscolorprotocol>)item:(NSInteger)index;

@end