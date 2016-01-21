#import "vcam.h"

@implementation vcam

-(instancetype)init:(ccam*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[spinner(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)addfinder:(AVCaptureSession*)session
{
    [self.spinner removeFromSuperview];
    
    vcamfinder *finder = [[vcamfinder alloc] init:session];
    self.finder = finder;
    
    [self addSubview:finder];
    
    NSDictionary *views = @{@"finder":finder};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[finder]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[finder]-0-|" options:0 metrics:metrics views:views]];
}

@end