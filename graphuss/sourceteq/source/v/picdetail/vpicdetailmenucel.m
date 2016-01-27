#import "vpicdetailmenucel.h"

@implementation vpicdetailmenucel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *base = [[UIView alloc] init];
    [base setClipsToBounds:YES];
    [base setUserInteractionEnabled:NO];
    [base.layer setCornerRadius:4];
    [base setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.base = base;

    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    [self addSubview:base];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"base":base};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-4-[base]-4-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[base]-20-|" options:0 metrics:metrics views:views]];
    
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
        [self.base setBackgroundColor:colormain];
        [self.label setTextColor:[UIColor whiteColor]];
        [self.label setFont:[UIFont fontWithName:fontboldname size:16]];
    }
    else
    {
        [self.base setBackgroundColor:[UIColor clearColor]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
        [self.label setFont:[UIFont fontWithName:fontname size:14]];
    }
}

#pragma mark public

-(void)config:(id<mpicmenuprotocol>)model
{
    [self.label setText:[model title]];
    [self hover];
}

@end