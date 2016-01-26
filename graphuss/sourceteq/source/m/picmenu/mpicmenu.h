#import "appdel.h"
#import "mpicmenuprotocol.h"

@interface mpicmenu:NSObject

-(NSInteger)count;
-(id<mpicmenuprotocol>)item:(NSInteger)index;

@end