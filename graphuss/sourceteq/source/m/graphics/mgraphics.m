#import "mgraphics.h"

@implementation mgraphics

+(UIImage*)scale:(UIImage*)image at:(CGFloat)scale
{
    CGImageRef cgimage = image.CGImage;
    NSUInteger width = floorf(CGImageGetWidth(cgimage) * scale);
    NSUInteger height = floorf(CGImageGetHeight(cgimage) * scale);
    NSUInteger bitspercomponent = 8;
    NSUInteger bytesperrow = 4 * width;
    CGColorSpaceRef colorspace = CGImageGetColorSpace(cgimage);
    CGBitmapInfo bitmapinfo = CGImageGetBitmapInfo(cgimage);
    CGContextRef context = CGBitmapContextCreate(nil, width, height, bitspercomponent, bytesperrow, colorspace, bitmapinfo);
    CGColorSpaceRelease(colorspace);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), cgimage);
    CGImageRef newcgimage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    UIImage *scaledimage = [UIImage imageWithCGImage:newcgimage scale:1 orientation:image.imageOrientation];
    CGImageRelease(newcgimage);
    
    return scaledimage;
}

+(UIImage*)merge:(UIImage*)image with:(UIColor*)incolor
{
    CGSize size = image.size;
    NSInteger width = size.width;
    NSInteger height = size.height;
    CGRect rect = CGRectMake(0, 0, width, height);
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    CGContextSetFillColorWithColor(context, incolor.CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextRelease(context);
    UIGraphicsEndImageContext();
    
    return newimage;
}

+(UIImage*)light:(UIImage*)image add:(CGFloat)light
{
    uint *pixels;
    CGContextRef context;
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGImageRef cgimage = image.CGImage;
    uint width = (uint)CGImageGetWidth(cgimage);
    uint height = (uint)CGImageGetHeight(cgimage);
    uint size = width * height;
    uint bitsperpixel = 4;
    uint bitspercomponent = 8;
    uint bytesperrow = bitsperpixel * width;
    CGRect rect = CGRectMake(0, 0, width, height);
    
    pixels = calloc(size, sizeof(uint));
    context = CGBitmapContextCreate(pixels, width, height, bitspercomponent, bytesperrow, colorspace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextDrawImage(context, rect, cgimage);
    
    uint *thispixel = pixels;
    
    for(uint i = 0; i < size; i++)
    {
        uint pixelcolor = *thispixel;
        mgraphicspixel *graphicspixel = [[mgraphicspixel alloc] init:pixelcolor];
//
        *thispixel = [graphicspixel addlight:light];
        thispixel++;
    }
    
    CGImageRef newcgimage = CGBitmapContextCreateImage(context);
    UIImage *editedimage = [UIImage imageWithCGImage:newcgimage scale:1 orientation:image.imageOrientation];
     
     //    free(pixels);
     
     return editedimage;
}

@end