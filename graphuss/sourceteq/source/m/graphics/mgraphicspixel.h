#import "appdel.h"

@interface mgraphicspixel:NSObject

+(uint)intfromintsred:(uint)red green:(uint)green blue:(uint)blue;
+(uint)intfromred:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+(uint)colortoint:(UIColor*)color;
-(instancetype)init:(uint)color;
-(CGFloat)redfloat;
-(CGFloat)greenfloat;
-(CGFloat)bluefloat;
-(UIColor*)colorrgb;

@property(nonatomic)uint red255;
@property(nonatomic)uint green255;
@property(nonatomic)uint blue255;

@end