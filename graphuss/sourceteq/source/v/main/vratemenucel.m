#import "vratemenucel.h"

@implementation vratemenucel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setClipsToBounds:YES];
    [image setImage:[[UIImage imageNamed:@"star"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setContentMode:UIViewContentModeScaleAspectFit];

    self.choosen = NO;
    self.image = image;
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[image]-8-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[image]-8-|" options:0 metrics:metrics views:views]];
    [self hover];
    
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
    if(self.choosen)
    {
        [self.image setTintColor:colormain];
    }
    else
    {
        [self.image setTintColor:[UIColor colorWithWhite:0 alpha:0.1]];
    }
}

#pragma mark public

-(void)choose:(BOOL)choosen
{
    self.choosen = choosen;
    [self hover];
}

@end