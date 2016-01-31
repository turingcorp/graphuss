#import "vpicdetailfilterscolorcel.h"

@implementation vpicdetailfilterscolorcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    NSUInteger margin = 30;
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
    [image.layer setCornerRadius:radiusimage];
    self.image = image;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:fontboldname size:16]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    [self addSubview:circle];
    [self addSubview:label];
    [self addSubview:image];
    
    NSDictionary *views = @{@"circle":circle, @"image":image, @"label":label};
    NSDictionary *metric = @{@"margin":@(margin), @"marginimage":@(marginimage)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[circle]-(margin)-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[circle]-(margin)-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-5-|" options:0 metrics:metric views:views]];
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
        [self.label setTextColor:[UIColor blackColor]];
        [self.circle setBackgroundColor:colormain];
        [self.image setAlpha:1];
    }
    else
    {
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
        [self.circle setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2]];
        [self.image setAlpha:0.3];
    }
}

#pragma mark public

-(void)config:(id<mpicmenufilterscolorprotocol>)model filters:(vpicdetailfilters*)filters
{
    [self.label setText:[model title]];
    [self.image setImage:nil];
    [self hover];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       mgraphicsfilterbwbasic *filter = [model filter];
                       UIImage *image = [mgraphics image:filters.detail.pic.thumb add:filter];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [self.image setImage:image];
                                      });
                   });
}

@end