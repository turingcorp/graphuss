#import "mconfigabout.h"

@implementation mconfigabout

#pragma mark -
#pragma mark config protocol

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"config_item_about", nil);
    
    return name;
}

-(UIViewController*)controller
{
    UIViewController *controller = [[UIViewController alloc] init];
    
    return controller;
}

@end