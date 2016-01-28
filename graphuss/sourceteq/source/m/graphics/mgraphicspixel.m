#import "mgraphicspixel.h"

@implementation mgraphicspixel

-(instancetype)init:(uint)color
{
    self = [super init];

    self.red255 = color & 0xFF;
    self.green255 = (color >> 8) & 0xFF;
    self.blue255 = (color >> 16) & 0xFF;
    
    return self;
}

#pragma mark functionality

-(CGFloat)redfloat
{
    return self.red255 / 255.0;
}

-(CGFloat)greenfloat
{
    return self.green255 / 255.0;
}

-(CGFloat)bluefloat
{
    return self.blue255 / 255.0;
}

-(UIColor*)colorrgb
{
    return [UIColor colorWithRed:[self redfloat] green:[self greenfloat] blue:[self bluefloat] alpha:1];
}

-(UIColor*)color:(UIColor*)color addbrightness:(CGFloat)delta
{
    UIColor *newcolor;
    
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:nil];
    brightness += delta;
    newcolor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return newcolor;
}

-(uint)intfromred:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    uint colorint;
    
    uint redint = red * 255;
    uint greenint = green * 255;
    uint blueint = blue * 255;
    colorint = (redint & 0xFF) | ((greenint & 0xFF) << 8) | ((blueint & 0xFF) << 16) | ((255 & 0xFF) << 24);
    
    return colorint;
}

-(uint)colortoint:(UIColor*)color
{
    uint colorint;
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    [color getRed:&red green:&green blue:&blue alpha:nil];
    colorint = [self intfromred:red green:green blue:blue];
    
    return colorint;
}

#pragma mark public

-(uint)addlight:(CGFloat)light
{
    uint newcolor;
    
    UIColor *colorcurrent = [self colorrgb];
    UIColor *coloredited = [self color:colorcurrent addbrightness:light];
    newcolor = [self colortoint:coloredited];
    
    return newcolor;
}

@end


/*


 #define Mask8(x) ( (x) & 0xFF )
 #define R(x) ( Mask8(x) )
 #define G(x) ( Mask8(x >> 8 ) )
 #define B(x) ( Mask8(x >> 16) )
 #define RGBAMake(r, g, b, a) ( Mask8(r) | Mask8(g) << 8 | Mask8(b) << 16 | Mask8(a) << 24 )

*/
