#import "vpicdetaileditcel.h"

@implementation vpicdetaileditcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
 
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setClipsToBounds:YES];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setUserInteractionEnabled:NO];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    self.icon = icon;
    
    [self addSubview:icon];
    
    NSDictionary *views = @{@"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[icon]-20-|" options:0 metrics:metrics views:views]];
    
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
        [self.icon setTintColor:[colormain colorWithAlphaComponent:0.1]];
    }
    else
    {
        [self.icon setTintColor:colormain];
    }
}

#pragma mark public

-(void)config:(id<mpicmenueditprotocol>)model
{
    [self.icon setImage:[[UIImage imageNamed:[model image]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self hover];
}

@end