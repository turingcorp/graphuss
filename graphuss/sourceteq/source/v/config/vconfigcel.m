#import "vconfigcel.h"

@implementation vconfigcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    []
}

#pragma mark public

-(void)config:(id<mconfigprotocol>)item
{
    
}

@end