#import "appdel.h"
#import "mpicmenufiltersprotocol.h"
#import "mpicmenufiltersbwprotocol.h"

@interface mpicmenufiltersbw:NSObject<mpicmenufiltersprotocol>

-(NSInteger)count;
-(id<mpicmenufiltersbwprotocol>)item:(NSInteger)index;

@end