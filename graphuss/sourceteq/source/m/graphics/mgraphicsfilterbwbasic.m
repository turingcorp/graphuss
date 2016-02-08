#import "mgraphicsfilterbwbasic.h"

@implementation mgraphicsfilterbwbasic

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint sum = pixel.red255 + pixel.green255 + pixel.blue255;
    uint average = round(sum / 3.0);
    newcolor = [mgraphicspixel intfromintsred:average green:average blue:average];
    
    return newcolor;
}

@end