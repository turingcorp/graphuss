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
    [controller flashtype:cam_flash_auto];
}

@end