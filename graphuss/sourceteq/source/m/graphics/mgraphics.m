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
    /*
    UInt32 *pixels;
    CGImageRef incgimage = image.CGImage;
    NSUInteger width = CGImageGetWidth(incgimage);
    NSUInteger height = CGImageGetHeight(incgimage);
    NSUInteger bitsperpixel = 4;
    NSUInteger bytesperrow = bitsperpixel * width;
    NSUInteger bitspercomponent = 8;
    
    pixels = (UInt32*)calloc(height * width, sizeof(UInt32));
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, bitspercomponent, bytesperrow, colorspace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), incgimage);
//    CGColorSpaceRelease(colorspace);
//    CGContextRelease(context);
    
#define Mask8(x) ( (x) & 0xFF )
#define R(x) ( Mask8(x) )
#define G(x) ( Mask8(x >> 8 ) )
#define B(x) ( Mask8(x >> 16) )
#define RGBAMake(r, g, b, a) ( Mask8(r) | Mask8(g) << 8 | Mask8(b) << 16 | Mask8(a) << 24 )
    
    UInt32 *thispixel = pixels;
    
    for(NSUInteger j = 0; j < height; j++)
    {
        for(NSUInteger i = 0; i < width; i++)
        {
            UInt32 color = *thispixel;
            NSUInteger red = R(color);
            NSUInteger green = G(color);
            NSUInteger blue = B(color);
            NSUInteger sum = red + green + blue;
            NSUInteger sumdivided = sum / 3.0;
            
            //**
            
            UIColor *pitchcolor = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
            
            CGFloat hue;
            CGFloat sat;
            CGFloat bri;
            CGFloat alp;
            
            [pitchcolor getHue:&hue saturation:&sat brightness:&bri alpha:&alp];
            
            bri -= 0.3;
            
            if(bri < 0)
            {
                bri = 0;
            }
            
            UIColor *anothercolor = [UIColor colorWithHue:hue saturation:sat brightness:bri alpha:alp];
            
            CGFloat newred;
            CGFloat newgren;
            CGFloat newblue;
            CGFloat newalpha;
            
            [anothercolor getRed:&newred green:&newgren blue:&newblue alpha:&newalpha];
            
            NSInteger newredint = newred * 255;
            NSInteger newgreenint = newgren * 255;
            NSInteger newblueint = newblue * 255;
            NSInteger newalphaint = newalpha * 255;
            
            *thispixel = RGBAMake(newredint, newgreenint, newblueint, newalphaint);
            
            //**
            
            thispixel++;
        }
    }
    
    CGImageRef newCGImage = CGBitmapContextCreateImage(context);
    UIImage * processedImage = [UIImage imageWithCGImage:newCGImage scale:1 orientation:image.imageOrientation];
    
//    free(pixels);
    
    return processedImage;*/
}

@end