#import "mcamitemexposure.h"

@implementation mcamitemexposure

-(instancetype)init
{
    self = [super init];
    
    self.title = NSLocalizedString(@"cam_menu_item_exposure", nil);
    
    return self;
}

#pragma mark public

-(void)selected:(vcammenuoptions*)options
{
    [super selected:options];
    
    vcamexposure *exposure = [[vcamexposure alloc] init:(ccam*)options.viewcam.controller];
    options.overview = exposure;
    [options addSubview:exposure];
    
    NSDictionary *views = @{@"exposure":exposure};
    NSDictionary *metrics = @{};
    
    [options addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[exposure]-0-|" options:0 metrics:metrics views:views]];
    [options addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[exposure]-50-|" options:0 metrics:metrics views:views]];
}

@end