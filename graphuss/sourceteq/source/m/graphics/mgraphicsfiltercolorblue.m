#import "mgraphicsfiltercolorblue.h"

@implementation mgraphicsfiltercolorblue

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint red = pixel.red255;
    uint green = pixel.green255;
    uint blue = pixel.blue255;
    uint delta = 20;
    
    if(blue > green)
    {
        if(blue > red)
        {
            blue += delta;
            
            if(blue > 255)
            {
                blue = 255;
            }
        }
    }
    
    newcolor = [mgraphicspixel intfromintsred:red green:green blue:blue];
    
    return newcolor;
}

@end