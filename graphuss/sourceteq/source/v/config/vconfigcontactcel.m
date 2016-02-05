#import "vconfigcontactcel.h"

@implementation vconfigcontactcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    return self;
}

#pragma mark public

-(void)config:(id<mconfigcontactprotocol>)model
{
    
}

@end