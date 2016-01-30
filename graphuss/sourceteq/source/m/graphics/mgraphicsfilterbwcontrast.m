#import "mgraphicsfilterbwcontrast.h"

@implementation mgraphicsfilterbwcontrast

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint sum = pixel.red255 + pixel.green255 + pixel.blue255;
    uint average = round(sum / 3.0);
    
    if(average < 246)
    {
        if(average > 127)
        {
            average += 10;
        }
        else if(average > 9)
        {
            average -= 10;
        }
    }
    
    newcolor = [mgraphicspixel intfromintsred:average green:average blue:average];
    
    return newcolor;
}

@end