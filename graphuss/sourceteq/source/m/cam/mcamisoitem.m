#import "mcamisoitem.h"

@implementation mcamisoitem

-(instancetype)init:(CGFloat)isoamount
{
    self = [super init];
    
    self.isoamount = isoamount;
    
    return self;
}

@end