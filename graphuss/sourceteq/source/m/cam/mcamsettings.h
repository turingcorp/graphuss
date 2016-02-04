#import "appdel.h"

@interface mcamsettings:NSObject

+(instancetype)singleton;
-(void)refresh;
-(void)focusauto:(BOOL)focusautomatic;
-(void)focusamount:(CGFloat)focusamount;

@property(nonatomic)NSUInteger focusamount;
@property(nonatomic)BOOL focusautomatic;

@end