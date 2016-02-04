#import "mcamflashitemtorch.h"

@implementation mcamflashitemtorch

-(instancetype)init
{
    self = [super init];
    
    self.name = NSLocalizedString(@"cam_menu_item_flash_torch", nil);
    
    return self;
}

#pragma mark -
#pragma mark flash item

-(void)selected:(ccam*)controller
{
    [[analytics singleton] trackevent:ga_event_cam_flash action:ga_action_torch label:nil];
    [controller flashtype:cam_flash_torch];
}

-(BOOL)equalstype:(NSInteger)type
{
    return (cam_flash)type == cam_flash_torch;
}

@end