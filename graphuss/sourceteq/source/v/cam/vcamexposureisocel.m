#import "vcamexposureisocel.h"

@implementation vcamexposureisocel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat margin = 1;
    CGFloat margin2 = margin * 2;
    CGFloat width = frame.size.width - margin2;
    
    UIView *circle = [[UIView alloc] init];
    [circle setClipsToBounds:YES];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setBackgroundColor:colormain];
    [circle.layer setCornerRadius:width / 2.0];
    self.circle = circle;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    [self addSubview:circle];
    [self addSubview:label];
    
    NSDictionary *views = @{@"circle":circle, @"label":label};
    NSDictionary *metrics = @{@"margin":@(margin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[circle]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[circle]-(margin)-|" options:0 metrics:metrics views:views]];
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
        [self.label setFont:[UIFont fontWithName:fontboldname size:12]];
        [self.label setTextColor:[UIColor whiteColor]];
        [self.circle setHidden:NO];
    }
    else
    {
        [self.label setFont:[UIFont fontWithName:fontname size:12]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
        [self.circle setHidden:YES];
    }
}

#pragma mark public

-(void)config:(mcamisoitem*)item
{
    NSUInteger isointeger = floor(item.isoamount);
    NSString *label = [[tools singleton] numbertostring:@(isointeger)];
    
    [self.label setText:label];
    [self hover];
}

@end