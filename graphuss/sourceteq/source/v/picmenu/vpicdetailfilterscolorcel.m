#import "vpicdetailfilterscolorcel.h"

@implementation vpicdetailfilterscolorcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    NSUInteger celside = frame.size.width;
    NSUInteger circleside = celside - 10;
    CGFloat radius = circleside / 2.0;
    
    UIView *circle = [[UIView alloc] init];
    [circle setClipsToBounds:YES];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle.layer setCornerRadius:radius];
    self.circle = circle;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    self.image = image;
    
    [self addSubview:circle];
    [self addSubview:image];
    
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
        [self.circle setBackgroundColor:colormain];
    }
    else
    {
        [self.circle setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark public

-(void)config:(id<mpicmenufilterscolorprotocol>)model
{
    [self hover];
}

@end