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
    uint delta;
    BOOL isblack = NO;
    
    if(sum < 150)
    {
        NSInteger maxdelta = 6;
        NSInteger drg = labs(red - green);
        NSInteger dgb = labs(green - blue);
        
        if(drg < maxdelta)
        {
            if(dgb < maxdelta)
            {
                isblack = YES;
            }
        }
    }
    
    if(isblack)
    {
        delta = 50;
    }
    else
    {
        delta = 30;
    }
    
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
    
    newcolor = [mgraphicspixel intfromintsred:(uint)red green:(uint)green blue:(uint)blue];
    
    return newcolor;
}

@end