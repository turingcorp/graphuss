#import "mgraphicsfiltercolorblack.h"

@implementation mgraphicsfiltercolorblack

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    NSInteger red = pixel.red255;
    NSInteger green = pixel.green255;
    NSInteger blue = pixel.blue255;
    NSInteger sum = red + green + blue;
    
    if(sum < 80)
    {
        NSInteger maxdelta = 5;
        NSInteger drg = labs(red - green);
        NSInteger dgb = labs(green - blue);
        
        if(drg < maxdelta)
        {
            if(dgb < maxdelta)
            {
                NSInteger delta = 20;
                
                red -= delta;
                green -= delta;
                blue -= delta;
                
                if(red < 0)
                {
                    red = 0;
                }
                
                if(green < 0)
                {
                    green = 0;
                }
                
                if(blue < 0)
                {
                    blue = 0;
                }
            }
        }
    }
    
    newcolor = [mgraphicspixel intfromintsred:(uint)red green:(uint)green blue:(uint)blue];
    
    return newcolor;
}

@end