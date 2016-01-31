#import "mgraphicsfiltercoloronlyred.h"

@implementation mgraphicsfiltercoloronlyred

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint red = pixel.red255;
    uint green = pixel.green255;
    uint blue = pixel.blue255;
    uint newred;
    uint newgreen;
    uint newblue;
    BOOL isred = NO;
    
    if(red > green)
    {
        if(red > blue)
        {
            if(green > blue)
            {
                isred = YES;
            }
        }
    }
    
    if(isred)
    {
        newred = red;
        newblue = blue;
        newgreen = green;
    }
    else
    {
        uint sum = red + green + blue;
        uint average = round(sum / 3.0);
        newred = average;
        newgreen = average;
        newblue = average;
    }
    
    newcolor = [mgraphicspixel intfromintsred:newred green:newgreen blue:newblue];
    
    return newcolor;
}

@end