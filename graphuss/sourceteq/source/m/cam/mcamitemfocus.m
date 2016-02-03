#import "mcamitemfocus.h"

@implementation mcamitemfocus

-(instancetype)init
{
    self = [super init];
    
    self.title = NSLocalizedString(@"cam_menu_item_focus", nil);
    
    return self;
}

@end