#import "vpicdetail.h"

@implementation vpicdetail

-(instancetype)init:(cpicdetail*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.controllerdetail = controller;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    vpicdetailmenu *menu = [[vpicdetailmenu alloc] init];
    self.menu = menu;
    
    [self addSubview:image];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"image":image, @"menu":menu};
    NSDictionary *metrics = @{};

    self.conimageheight = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(80)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.conimageheight];
    
    [self showedit];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.conimageheight.constant = self.bounds.size.width;
}

#pragma mark public

-(void)loadpic:(mpicitem*)pic
{
    self.pic = pic;
    [self.image setImage:pic.imagehd];
}

-(void)showedit
{
    [self.overview removeFromSuperview];
    
    vpicdetailedit *edit = [[vpicdetailedit alloc] init:self];
    self.overview = edit;
    
    [self addSubview:edit];
    
    NSDictionary *views = @{@"edit":edit, @"menu":self.menu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[edit]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[edit(60)]-0-[menu]" options:0 metrics:metrics views:views]];
}

@end