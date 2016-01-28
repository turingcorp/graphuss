#import "mgraphics.h"

@implementation mgraphics

+(UIImage*)scale:(UIImage*)image at:(CGFloat)scale
{
    CGImageRef cgimage = image.CGImage;
    NSInteger width = floorf(CGImageGetWidth(cgimage) * scale);
    NSInteger height = floorf(CGImageGetHeight(cgimage) * scale);
    NSInteger bitspercomponent = 8;
    NSInteger bytesperrow = 4 * width;
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

+(UIImage*)merge:(UIImage*)image with:(UIColor*)color
{/*
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
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextRelease(context);
    UIGraphicsEndImageContext();
    
    return newimage;*/
    
    UInt32 *pixels;
    CGImageRef incgimage = image.CGImage;
    CGSize size = image.size;
    NSUInteger width = size.width;
    NSUInteger height = size.height;
    NSUInteger bitsperpixel = 4;
    NSUInteger bytesperrow = bitsperpixel * width;
    NSUInteger bitspercomponent = 8;
    
    pixels = (UInt32*)calloc(height * width, sizeof(UInt32));
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, bitspercomponent, bytesperrow, colorspace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), incgimage);
    CGColorSpaceRelease(colorspace);
    CGContextRelease(context);
    
#define Mask8(x) ( (x) & 0xFF )
#define R(x) ( Mask8(x) )
#define G(x) ( Mask8(x >> 8 ) )
#define B(x) ( Mask8(x >> 16) )
    
    NSLog(@"Brightness of image:");

    UInt32 *thispixel = pixels;
    
    for(NSUInteger j = 0; j < height; j++)
    {
        for(NSUInteger i = 0; i < width; i++)
        {
            
        }
    }
    
    UInt32 * currentPixel = pixels;
    for (NSUInteger j = 0; j < height; j++) {
        for (NSUInteger i = 0; i < width; i++) {
            // 3.
            UInt32 color = *currentPixel;
            printf("%3.0f ", (R(color)+G(color)+B(color))/3.0);
            // 4.
            currentPixel++;
        }
        printf("\n");
    }
    
    return image;
}

@end