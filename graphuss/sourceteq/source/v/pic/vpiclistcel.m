#import "vpiclistcel.h"

@implementation vpiclistcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor redColor]];
    
    return self;
}

@end