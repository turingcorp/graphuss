#import "vpicdetailfilterscel.h"

@implementation vpicdetailfilterscel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *selector = [[UIView alloc] init];
    [selector setBackgroundColor:colormain];
    [selector setClipsToBounds:YES];
    [selector setUserInteractionEnabled:NO];
    [selector setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.selector = selector;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:12]];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    [self addSubview:image];
    [self addSubview:label];
    [self addSubview:selector];
    
    NSDictionary *views = @{@"selector":selector, @"image":image, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[selector]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[image(30)]-0-[label]-3-[selector(2)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self.selector setHidden:NO];
        [self.image setTintColor:colormain];
        [self.label setTextColor:colormain];
    }
    else
    {
        [self.selector setHidden:YES];
        [self.image setTintColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    }
}

#pragma mark public

-(void)config:(id<mpicmenufiltersprotocol>)model
{
    [self.image setImage:[[UIImage imageNamed:[model image]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.label setText:[model title]];
    [self hover];
}

@end