#import "mgraphicsfilterlight.h"

@implementation mgraphicsfilterlight
{
    CGFloat light;
}

-(UIColor*)addbrightness:(UIColor*)color
{
    UIColor *newcolor;
    
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:nil];
    brightness += light;
    newcolor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return newcolor;
}

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    UIColor *colorcurrent = [pixel colorrgb];
    UIColor *coloredited = [self addbrightness:colorcurrent];
    newcolor = [pixel colortoint:coloredited];
    
    return newcolor;
}

@end