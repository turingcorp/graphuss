#import "mcamitemexposure.h"

@implementation mcamitemexposure

-(instancetype)init
{
    self = [super init];
    
    self.title = NSLocalizedString(@"cam_menu_item_exposure", nil);
    
    return self;
}

@end