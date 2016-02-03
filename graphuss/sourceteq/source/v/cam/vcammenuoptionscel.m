#import "vcammenuoptionscel.h"

@implementation vcammenuoptionscel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont fontWithName:fontboldname size:12]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

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

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.label setTextColor:[UIColor blackColor]];
        [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    }
    else
    {
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
        [self setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark public

-(void)config:(mcamitem*)item
{
    [self.label setText:item.title];
    [self hover];
}

@end