#import "vcamexposureisocel.h"

@implementation vcamexposureisocel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat width = frame.size.width - 20;
    
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
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[circle]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[circle]-10-|" options:0 metrics:metrics views:views]];
    
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
        [self.label setFont:[UIFont fontWithName:fontboldname size:16]];
        [self.label setTextColor:[UIColor whiteColor]];
        [self.circle setHidden:NO];
    }
    else
    {
        [self.label setFont:[UIFont fontWithName:fontname size:14]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [self.circle setHidden:YES];
    }
}

#pragma mark public

-(void)config:(mcamisoitem*)item
{
    [self hover];
}

@end