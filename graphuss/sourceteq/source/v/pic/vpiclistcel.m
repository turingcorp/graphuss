#import "vpiclistcel.h"

@implementation vpiclistcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image.layer setCornerRadius:4];
    self.image = image;

    UIImageView *firsttime = [[UIImageView alloc] init];
    [firsttime setClipsToBounds:YES];
    [firsttime setContentMode:UIViewContentModeScaleAspectFit];
    [firsttime setUserInteractionEnabled:NO];
    [firsttime setTranslatesAutoresizingMaskIntoConstraints:NO];
    [firsttime setImage:[UIImage imageNamed:@"firsttime"]];
    self.firsttime = firsttime;
    
    [self addSubview:image];
    [self addSubview:firsttime];
    
    NSDictionary *views = @{@"image":image, @"firsttime":firsttime};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[firsttime(30)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[firsttime(30)]" options:0 metrics:metrics views:views]];
    
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
        [self.image setAlpha:0.2];
    }
    else
    {
        [self.image setAlpha:1];
    }
}

#pragma mark public

-(void)config:(mpicitem*)pic
{
    self.pic = pic;
    [self.image setImage:pic.thumb];
    
    if(pic.firsttime)
    {
        [self.firsttime setHidden:NO];
    }
    else
    {
        [self.firsttime setHidden:YES];
    }
    
    [self hover];
}

@end