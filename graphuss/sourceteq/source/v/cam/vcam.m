#import "vcam.h"

@implementation vcam

-(instancetype)init:(ccam*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    vcammenu *menu = [[vcammenu alloc] init];
    self.menu = menu;
    
    vcamfinder *finder = [[vcamfinder alloc] init];
    self.finder = finder;
    
    [self addSubview:finder];
    [self addSubview:spinner];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"spinner":spinner, @"menu":menu, @"finder":finder};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[spinner(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(60)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[finder]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[finder]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)addfinder:(AVCaptureSession*)session
{
    [self.spinner removeFromSuperview];
    [self.finder startsession:session];
}

@end