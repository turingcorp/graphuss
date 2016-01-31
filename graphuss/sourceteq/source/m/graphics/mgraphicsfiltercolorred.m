#import "mgraphicsfiltercolorred.h"

@implementation mgraphicsfiltercolorred

#pragma mark -
#pragma mark filter protocol

-(uint)applyto:(mgraphicspixel*)pixel
{
    uint newcolor;
    uint red = pixel.red255;
    uint green = pixel.green255;
    uint blue = pixel.blue255;
    
    
    
    newcolor = [mgraphicspixel intfromintsred:red green:green blue:blue];
    
    return newcolor;
}

@end