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
    
    [self addSubview:selector];
    
    NSDictionary *views = @{@"selector":selector};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[selector]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[selector(4)]-0-|" options:0 metrics:metrics views:views]];
    
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
    }
    else
    {
        [self.selector setHidden:YES];
        [self.image setTintColor:[UIColor colorWithWhite:0 alpha:0.4]];
    }
}

#pragma mark public

-(void)config:(id<mpicmenufiltersprotocol>)model
{
    [self hover];
}

@end