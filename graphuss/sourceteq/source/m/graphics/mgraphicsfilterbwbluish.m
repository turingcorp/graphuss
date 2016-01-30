#import "mgraphicsfilterbwbluish.h"

@implementation mgraphicsfilterbwbluish

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint sum = pixel.red255 + pixel.green255 + pixel.blue255;
    uint average = round(sum / 3.0);
    uint delta = 10;
    uint ured;
    uint ublue;
    NSInteger averagered = average;
    NSInteger averageblue = average;
    averagered -= delta;
    averageblue += delta;
    
    if(averagered < 0)
    {
        averagered = 0;
    }
    
    if(averageblue > 255)
    {
        averageblue = 255;
    }
    
    ublue = (uint)averageblue;
    ured = (uint)averagered;
    
    newcolor = [mgraphicspixel intfromintsred:ured green:average blue:ublue];
    
    return newcolor;
}

@end