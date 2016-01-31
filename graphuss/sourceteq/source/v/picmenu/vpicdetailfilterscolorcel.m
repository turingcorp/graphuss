#import "vpicdetailfilterscolorcel.h"

@implementation vpicdetailfilterscolorcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    NSUInteger margin = 20;
    NSUInteger marginimage = margin + 2;
    NSUInteger celside = frame.size.width;
    NSUInteger circleside = celside - margin - margin;
    NSUInteger imageside = celside - marginimage - marginimage;
    CGFloat radiuscircle = circleside / 2.0;
    CGFloat radiusimage = imageside / 2.0;
    
    UIView *circle = [[UIView alloc] init];
    [circle setClipsToBounds:YES];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle.layer setCornerRadius:radiuscircle];
    self.circle = circle;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image.layer setCornerRadius:marginimage];
    self.image = image;
    
    [self addSubview:circle];
    [self addSubview:image];
    
    NSDictionary *views = @{@"circle":circle, @"image":image};
    NSDictionary *metric = @{@"margin":@(margin), @"marginimage":@(marginimage)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[circle]-(margin)-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[circle]-(margin)-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(marginimage)-[image]-(marginimage)-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(marginimage)-[image]-(marginimage)-|" options:0 metrics:metric views:views]];
    
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