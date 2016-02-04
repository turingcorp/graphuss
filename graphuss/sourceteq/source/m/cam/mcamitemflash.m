#import "mcamitemflash.h"

@implementation mcamitemflash

-(instancetype)init
{
    self = [super init];
    
    self.title = NSLocalizedString(@"cam_menu_item_flash", nil);
    
    return self;
}

#pragma mark public

-(void)selected:(vcammenuoptions*)options
{
    [super selected:options];
    
    vcamflash *flash = [[vcamflash alloc] init:(ccam*)options.viewcam.controller];
    options.overview = flash;
    [options addSubview:flash];
    
    NSDictionary *views = @{@"flash":flash};
    NSDictionary *metrics = @{};
    
    [options addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[focus]-0-|" options:0 metrics:metrics views:views]];
    [options addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[focus]-50-|" options:0 metrics:metrics views:views]];
}

@end