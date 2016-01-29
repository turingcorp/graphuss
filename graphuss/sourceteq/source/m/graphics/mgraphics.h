#import "appdel.h"

@interface mgraphics:NSObject

+(UIImage*)scale:(UIImage*)image at:(CGFloat)scale;
+(UIImage*)merge:(UIImage*)image with:(UIColor*)color;
+(UIImage*)light:(UIImage*)image add:(CGFloat)light;
+(UIImage*)light2:(UIImage*)image add:(CGFloat)light;

@end