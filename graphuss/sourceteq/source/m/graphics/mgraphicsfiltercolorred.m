#import "mgraphicsfiltercolorred.h"

@implementation mgraphicsfiltercolorred

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint red = pixel.red255;
    uint green = pixel.green255;
    uint blue = pixel.blue255;
    uint delta = 20;
    
    if(red > green)
    {
        if(red > blue)
        {
            if(green >= blue)
            {
                red += delta;
                
                if(red > 255)
                {
                    red = 255;
                }
            }
        }
    }
    
    newcolor = [mgraphicspixel intfromintsred:red green:green blue:blue];
    
    return newcolor;
}

@end