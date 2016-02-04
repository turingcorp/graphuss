#import "vconfigcel.h"

@implementation vconfigcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

#pragma mark public

-(void)config:(id<mconfigprotocol>)item
{
    
}

@end