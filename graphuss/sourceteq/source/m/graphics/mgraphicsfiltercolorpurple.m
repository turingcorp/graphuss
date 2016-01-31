#import "mgraphicsfiltercolorpurple.h"

@implementation mgraphicsfiltercolorpurple

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint red = pixel.red255;
    uint green = pixel.green255;
    uint blue = pixel.blue255;

    red += 20;
    blue += 40;
    
    if(red > 255)
    {
        red = 255;
    }
    
    if(blue > 255)
    {
        blue = 255;
    }

    newcolor = [mgraphicspixel intfromintsred:red green:green blue:blue];
    
    return newcolor;
}

@end