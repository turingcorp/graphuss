#import "mgraphicspixel.h"

@implementation mgraphicspixel

-(instancetype)init:(uint)color
{
    self = [super init];

    self.red255 = color & 0xFF;
    self.green255 = (color >> 8) & 0xFF;
    self.blue255 = (color >> 16) & 0xFF;
    
    return self;
}

@end


/*


 #define Mask8(x) ( (x) & 0xFF )
 #define R(x) ( Mask8(x) )
 #define G(x) ( Mask8(x >> 8 ) )
 #define B(x) ( Mask8(x >> 16) )
 #define RGBAMake(r, g, b, a) ( Mask8(r) | Mask8(g) << 8 | Mask8(b) << 16 | Mask8(a) << 24 )

*/
