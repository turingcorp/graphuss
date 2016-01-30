#import "mgraphicsfilterbwbluish.h"

@implementation mgraphicsfilterbwbluish

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint sum = pixel.red255 + pixel.green255 + pixel.blue255;
    uint average = round(sum / 3.0);
    uint averagered = average;
    uint averageblue = average;
    
    if(averagered > 9)
    {
        averagered -= 10;
    }
    
    if(averageblue < 246)
    {
        averageblue += 10;
    }
    
    newcolor = [mgraphicspixel intfromintsred:averagered green:average blue:averageblue];
    
    return newcolor;
}

#warning "color"

@end