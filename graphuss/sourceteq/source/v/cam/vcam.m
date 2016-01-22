#import "vcam.h"

@implementation vcam

-(instancetype)init:(ccam*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    vcammenu *menu = [[vcammenu alloc] init:self];
    self.menu = menu;
    
    vcamfinder *finder = [[vcamfinder alloc] init];
    self.finder = finder;
    
    [self addSubview:finder];
    [self addSubview:spinner];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"spinner":spinner, @"menu":menu, @"finder":finder};
    NSDictionary *metrics = @{};
    
    self.comenuheight = [NSLayoutConstraint constraintWithItem:menu attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    self.copreviewheight = [NSLayoutConstraint constraintWithItem:finder attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    
    [self addConstraint:self.comenuheight];
    [self addConstraint:self.copreviewheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[spinner(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[finder]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[finder]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat previewheight = width * 4.0 / 3.0;
    CGFloat menuheight = height - previewheight;
    
    if(menuheight < 60)
    {
        menuheight = 60;
    }
    
    self.comenuheight.constant = menuheight;
    self.copreviewheight.constant = previewheight;
}

#pragma mark public

-(void)addfinder:(AVCaptureSession*)session
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.spinner removeFromSuperview];
                       [self.finder startsession:session];
                   });
}

@end