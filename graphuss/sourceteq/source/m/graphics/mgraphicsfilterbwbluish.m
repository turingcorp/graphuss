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
    
    
    newcolor = [mgraphicspixel intfromintsred:averagered green:average blue:averageblue];
    
    return newcolor;
}

@end