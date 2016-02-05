#import "vconfigcontactcel.h"

@implementation vconfigcontactcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];

    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
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
        [self setBackgroundColor:colorsecond];
        [self.label setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    }
}

#pragma mark public

-(void)config:(id<mconfigcontactprotocol>)model
{
    [self.label setText:[model title]];
    [self hover];
}

@end