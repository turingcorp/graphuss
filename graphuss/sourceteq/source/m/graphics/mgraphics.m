#import "mgraphics.h"

@implementation mgraphics

+(UIImage*)scale:(UIImage*)image at:(CGFloat)scale
{
    NSInteger newwidth = floorf(image.size.width * scale);
    NSInteger newheight = floorf(image.size.height * scale);
    CGSize newsize = CGSizeMake(newwidth, newheight);
    CGRect newrect = CGRectMake(0, 0, newwidth, newheight);
    
    UIGraphicsBeginImageContextWithOptions(newsize, NO, 1);
    [image drawInRect:newrect];
    UIImage* scaledimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledimage;
}

+(UIImage*)merge:(UIImage*)image with:(UIColor*)color
{
    CGSize size = image.size;
    NSInteger width = size.width;
    NSInteger height = size.height;
    CGRect rect = CGRectMake(0, 0, width, height);
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextDrawPath(context, kCGPathFill);
//    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:0.8];
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newimage;
}

@end