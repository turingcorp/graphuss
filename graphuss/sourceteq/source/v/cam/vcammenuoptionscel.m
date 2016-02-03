#import "vcammenuoptionscel.h"

@implementation vcammenuoptionscel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

#pragma mark public

-(void)config:(mcamitem*)item
{
    
}

@end