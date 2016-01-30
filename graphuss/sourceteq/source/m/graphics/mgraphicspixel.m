#import "mgraphicspixel.h"

@implementation mgraphicspixel

+(uint)intfromintsred:(uint)red green:(uint)green blue:(uint)blue
{
    uint colorint = (red & 0xFF) | ((green & 0xFF) << 8) | ((blue & 0xFF) << 16) | ((255 & 0xFF) << 24);
    
    return colorint;
}

+(uint)intfromred:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    uint colorint;
    uint redint = red * 255;
    uint greenint = green * 255;
    uint blueint = blue * 255;
    
    colorint = [mgraphicspixel intfromintsred:redint green:greenint blue:blueint];
    
    return colorint;
}

+(uint)colortoint:(UIColor*)color
{
    uint colorint;
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    [color getRed:&red green:&green blue:&blue alpha:nil];
    colorint = [mgraphicspixel intfromred:red green:green blue:blue];
    
    return colorint;
}

-(instancetype)init:(uint)color
{
    self = [super init];

    self.red255 = color & 0xFF;
    self.green255 = (color >> 8) & 0xFF;
    self.blue255 = (color >> 16) & 0xFF;
    
    return self;
}

#pragma mark public

-(CGFloat)redfloat
{
    CGFloat value = self.red255 / 255.0;
    
    return value;
}

-(CGFloat)greenfloat
{
    CGFloat value = self.green255 / 255.0;
    
    return value;
}

-(CGFloat)bluefloat
{
    CGFloat value = self.blue255 / 255.0;
    
    return value;
}

-(UIColor*)colorrgb
{
    UIColor *incolor = [UIColor colorWithRed:[self redfloat] green:[self greenfloat] blue:[self bluefloat] alpha:1];
    
    return incolor;
}

@end