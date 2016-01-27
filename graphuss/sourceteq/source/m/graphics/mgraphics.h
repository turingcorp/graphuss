#import "appdel.h"

@interface mgraphics:NSObject

+(UIImage*)scale:(UIImage*)image at:(CGFloat)scale;
+(UIImage*)merge:(UIImage*)image with:(UIColor*)color;

@end