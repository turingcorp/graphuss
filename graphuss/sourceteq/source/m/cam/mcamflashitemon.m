#import "mcamflashitemon.h"

@implementation mcamflashitemon

-(instancetype)init
{
    self = [super init];
    
    self.name = NSLocalizedString(@"cam_menu_item_flash_on", nil);
    
    return self;
}

#pragma mark -
#pragma mark flash item

-(void)selected:(ccam*)controller
{
    [[analytics singleton] trackevent:ga_event_cam_flash action:ga_action_on label:nil];
    [controller flashtype:cam_flash_on];
}

-(BOOL)equalstype:(NSInteger)type
{
    return (cam_flash)type == cam_flash_on;
}

@end