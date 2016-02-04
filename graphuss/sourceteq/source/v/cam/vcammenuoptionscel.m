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
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:colormain];
    self.border = border;
    
    [self addSubview:label];
    [self addSubview:border];
    
    NSDictionary *views = @{@"label":label, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(3)]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self.border setHidden:NO];
    }
    else
    {
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [self setBackgroundColor:[UIColor clearColor]];
        [self.border setHidden:YES];
    }
}

#pragma mark public

-(void)config:(mcamitem*)item
{
    [self.label setText:item.title];
    [self hover];
}

@end