#import "mgraphicsfiltercolorpurple.h"

@implementation mgraphicsfiltercolorpurple

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    NSInteger red = pixel.red255;
    NSInteger green = pixel.green255;
    NSInteger blue = pixel.blue255;

    green -= 30;
    blue += 30;
    
    if(green < 0)
    {
        green = 0;
    }
    
    if(blue > 255)
    {
        blue = 255;
    }

    newcolor = [mgraphicspixel intfromintsred:(uint)red green:(uint)green blue:(uint)blue];
    
    return newcolor;
}

@end