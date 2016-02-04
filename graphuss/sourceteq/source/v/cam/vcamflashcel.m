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
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self setBackgroundColor:[colorsecond colorWithAlphaComponent:0.6]];
        [self.label setTextColor:[UIColor whiteColor]];
        [self.label setFont:[UIFont fontWithName:fontboldname size:13]];
    }
    else
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
        [self.label setFont:[UIFont fontWithName:fontname size:12]];
    }
}

#pragma mark public

-(void)config:(mcamflashitem*)item
{
    [self.label setText:item.name];
    [self hover];
}

@end