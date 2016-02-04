#import "vcamflashcel.h"

@implementation vcamflashcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2]];
    }
    else
    {
        [self setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark public

-(void)config:(mcamflashitem*)item
{
    [self hover];
}

@end