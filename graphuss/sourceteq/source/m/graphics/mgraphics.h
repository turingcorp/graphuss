#import "appdel.h"
#import "mgraphicsfilterprotocol.h"

@interface mgraphics:NSObject

+(UIImage*)scale:(UIImage*)image at:(CGFloat)scale;
+(UIImage*)merge:(UIImage*)image with:(UIColor*)color;
+(UIImage*)image:(UIImage*)image add:(id<mgraphicsfilterprotocol>)filter;

@end