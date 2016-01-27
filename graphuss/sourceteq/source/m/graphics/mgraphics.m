#import "mgraphics.h"

@implementation mgraphics

+(UIImage*)scale:(UIImage*)image scale:(CGFloat)scale
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

@end