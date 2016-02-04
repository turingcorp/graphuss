#import "vcamflashcel.h"

@implementation vcamflashcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    [self addSubview:label];
    
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
        [self.label setTextColor:[UIColor blackColor]];
        [self.label setFont:[UIFont fontWithName:fontboldname size:14]];
    }
    else
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [self.label setFont:[UIFont fontWithName:fontname size:14]];
    }
}

#pragma mark public

-(void)config:(mcamflashitem*)item
{
    [self.label setText:item.name];
    [self hover];
}

@end