#import "mgraphicsfilterbwcontrast.h"

@implementation mgraphicsfilterbwcontrast

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint sum = pixel.red255 + pixel.green255 + pixel.blue255;
    uint delta = 12;
    uint uaverage;
    NSInteger average = round(sum / 3.0);
    
    if(average > 127)
    {
        average += delta;
    }
    else
    {
        average -= delta;
    }
    
    if(average > 255)
    {
        average = 255;
    }
    else if(average < 0)
    {
        average = 0;
    }
    
    uaverage = (uint)average;
    
    newcolor = [mgraphicspixel intfromintsred:uaverage green:uaverage blue:uaverage];
    
    return newcolor;
}

@end