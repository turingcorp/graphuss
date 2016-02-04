#import "mcamflashitemauto.h"

@implementation mcamflashitemauto

-(instancetype)init
{
    self = [super init];
    
    self.name = NSLocalizedString(@"cam_menu_item_flash_auto", nil);
    
    return self;
}

#pragma mark -
#pragma mark flash item

-(void)selected:(ccam*)controller
{
    [[analytics singleton] trackevent:ga_event_cam_flash action:ga_action_automatic label:nil];
    [controller flashtype:cam_flash_auto];
}

-(BOOL)equalstype:(NSInteger)type
{
    return (cam_flash)type == cam_flash_auto;
}

@end