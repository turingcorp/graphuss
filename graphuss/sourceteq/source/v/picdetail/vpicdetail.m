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
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};

    self.conimageheight = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.conimageheight];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedwritingbusy:) name:notwritingbusy object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedwritingfree:) name:notwritingfree object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.conimageheight.constant = self.bounds.size.width;
}

#pragma mark notified

-(void)notifiedwritingbusy:(NSNotification*)notification
{
    [self animateoverview:NO];
}

-(void)notifiedwritingfree:(NSNotification*)notification
{
    [self animateoverview:YES];
}

#pragma mark functionality

-(void)animateoverview:(BOOL)show
{
    CGFloat alpha = 0;
    
    if(show)
    {
        alpha = 1;
    }
    
    [UIView animateWithDuration:0.3 animations:
     ^
     {
         [self.overview setAlpha:alpha];
     }];
}

#pragma mark public

-(void)loadpic:(mpicitem*)pic
{
    self.pic = pic;
    [self.image setImage:pic.imagehd];
}

-(void)loadmenu
{
    if(!self.menu)
    {
        vpicdetailmenu *menu = [[vpicdetailmenu alloc] init:self];
        self.menu = menu;
        
        [self addSubview:menu];
        
        NSDictionary *views = @{@"menu":menu};
        NSDictionary *metrics = @{};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(80)]-0-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    }
}

-(void)overrideoverview:(UIView*)overview
{
    [self.overview removeFromSuperview];
    self.overview = overview;
    
    [self addSubview:overview];
}

@end