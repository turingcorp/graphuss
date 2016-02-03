#import "appdel.h"

@interface mcamsettings:NSObject

+(instancetype)singleton;
-(void)refresh;

@property(nonatomic)NSUInteger focusamount;
@property(nonatomic)BOOL focusautomatic;

@end