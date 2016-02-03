#import "mcamitemfocus.h"

@implementation mcamitemfocus

-(instancetype)init
{
    self = [super init];
    
    self.title = NSLocalizedString(@"cam_menu_item_focus", nil);
    
    return self;
}

#pragma mark public

-(void)selected:(vcam*)viewcam
{
    [super selected:viewcam];
    
    vcamfocus *focus = [[vcamfocus alloc] init];
    viewcam.overview = focus;
    [viewcam addSubview:focus];
    
    NSDictionary *views = @{@"focus":focus};
    NSDictionary *metrics = @{};
    
    [viewcam addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[focus]-0-|" options:0 metrics:metrics views:viewcam]];
    [viewcam addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[focus]-0-|" options:0 metrics:metrics views:viewcam]];
}

@end