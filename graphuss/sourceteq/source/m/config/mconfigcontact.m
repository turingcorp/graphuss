#import "mconfigcontact.h"

@implementation mconfigcontact

#pragma mark -
#pragma mark config protocol

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"config_item_contact", nil);
    
    return name;
}

-(UIViewController*)controller
{
    UIViewController *controller = [[UIViewController alloc] init];
    
    return controller;
}

@end