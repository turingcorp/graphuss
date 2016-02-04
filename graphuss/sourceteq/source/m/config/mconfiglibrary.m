#import "mconfiglibrary.h"

@implementation mconfiglibrary

#pragma mark -
#pragma mark config protocol

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"config_item_library", nil);
    
    return name;
}

-(UIViewController*)controller
{
    cconfiglibrary *controller = [[cconfiglibrary alloc] init];
    
    return controller;
}

@end