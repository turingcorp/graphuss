#import "mgraphicsfiltercoloronlyblack.h"

@implementation mgraphicsfiltercoloronlyblack

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    NSInteger red = pixel.red255;
    NSInteger green = pixel.green255;
    NSInteger blue = pixel.blue255;
    NSInteger sum = red + green + blue;
    BOOL isblack = NO;
    
    if(sum < 100)
    {
        NSInteger maxdelta = 4;
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
        uint delta = 30;
        
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
    else
    {
        uint average = round(sum / 3.0);
        average += 10;
        
        if(average > 255)
        {
            average = 255;
        }
        
        red = average;
        green = average;
        blue = average;
    }
    
    newcolor = [mgraphicspixel intfromintsred:(uint)red green:(uint)green blue:(uint)blue];
    
    return newcolor;
}

@end