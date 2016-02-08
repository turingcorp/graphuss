#import "mcamitemfocus.h"

@implementation mcamitemfocus

-(instancetype)init
{
    self = [super init];
    
    self.title = NSLocalizedString(@"cam_menu_item_focus", nil);
    
    return self;
}

#pragma mark public

-(void)selected:(vcammenuoptions*)options
{
    [super selected:options];
    
    vcamfocus *focus = [[vcamfocus alloc] init:(ccam*)options.viewcam.controller];
    options.overview = focus;
    [options addSubview:focus];
    
    NSDictionary *views = @{@"focus":focus};
    NSDictionary *metrics = @{};
    
    [options addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[focus]-0-|" options:0 metrics:metrics views:views]];
    [options addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[focus]-50-|" options:0 metrics:metrics views:views]];
}

@end