#import "mconfigcontact.h"

@implementation mconfigcontact
{
    NSArray *array;
}

#pragma mark public

-(NSUInteger)count
{
    if(!array)
    {
        array = [NSArray arrayWithObjects:
                 [[mconfigcontactmessage alloc] init],
                 [[mconfigcontactemail alloc] init],
                 [[mconfigcontactrate alloc] init],
                 nil];
    }
    
    NSUInteger count = array.count;
    
    return count;
}

-(id<mconfigcontactprotocol>)item:(NSUInteger)index;
{
    id<mconfigcontactprotocol> item = array[index];
    
    return item;
}

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