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
    
    return scaledimage;/*
    
    NSUInteger width = image.size.width * scale;
    NSUInteger height = image.size.height * scale;
    CGImageRef cgimage = image.CGImage;
    NSUInteger bitspercomponent = CGImageGetBitsPerComponent(cgimage);
    NSUInteger bytesperrow = 4 * width;
    CGColorSpaceRef colorspace = CGImageGetColorSpace(cgimage);
    CGBitmapInfo bitmapinfo = CGImageGetBitmapInfo(cgimage);
    CGContextRef context = CGBitmapContextCreate(nil, width, height, bitspercomponent, bytesperrow, colorspace, bitmapinfo);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), cgimage);
    UIImage *scaledimage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    
    return scaledimage;*/
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
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextRelease(context);
    UIGraphicsEndImageContext();
    
    return newimage;
    /*
    CGSize size = image.size;
    NSUInteger width = size.width;
    NSUInteger height = size.height;
    CGImageRef inputCGImage = image.CGImage;
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    
    UInt32 * pixels;
    pixels = (UInt32 *) calloc(height * width, sizeof(UInt32));
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), inputCGImage);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
#define Mask8(x) ( (x) & 0xFF )
#define R(x) ( Mask8(x) )
#define G(x) ( Mask8(x >> 8 ) )
#define B(x) ( Mask8(x >> 16) )
    
    NSLog(@"Brightness of image:");
    // 2.
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
    }*/
}

@end