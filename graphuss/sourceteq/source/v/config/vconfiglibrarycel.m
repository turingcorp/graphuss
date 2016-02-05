#import "vconfiglibrarycel.h"

@implementation vconfiglibrarycel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.label setTextColor:[UIColor whiteColor]];
        [self setBackgroundColor:colormain];
    }
    else
    {
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark public

-(void)config:(id<mconfiglibraryprotocol>)item
{
    
}

@end