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
    
}

@end