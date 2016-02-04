#import "appdel.h"

@interface mcamsettings:NSObject

+(instancetype)singleton;
-(void)refresh;
-(void)focusauto:(BOOL)focusautomatic;
-(void)focusamount:(CGFloat)focusamount;
-(void)exposureauto:(BOOL)exposureauto;
-(void)exposureduration:(CGFloat)exposureduration;
-(void)exposureaiso:(CGFloat)exposureiso;

@property(nonatomic)CGFloat focusamount;
@property(nonatomic)CGFloat exposureduration;
@property(nonatomic)CGFloat exposureiso;
@property(nonatomic)BOOL focusautomatic;
@property(nonatomic)BOOL exposureautomatic;

@end