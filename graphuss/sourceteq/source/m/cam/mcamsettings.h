#import "appdel.h"

@interface mcamsettings:NSObject

+(instancetype)singleton;
-(void)refresh;
-(void)focusauto:(BOOL)automatic amount:(CGFloat)amount;
-(void)exposureauto:(BOOL)automatic duration:(CGFloat)duration iso:(CGFloat)iso;

@property(nonatomic)CGFloat focusamount;
@property(nonatomic)CGFloat exposureduration;
@property(nonatomic)CGFloat exposureiso;
@property(nonatomic)BOOL focusautomatic;
@property(nonatomic)BOOL exposureautomatic;

@end