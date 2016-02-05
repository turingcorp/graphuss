#import "mconfiglibrary.h"

@implementation mconfiglibrary
{
    NSArray *array;
}

#pragma mark public

-(NSUInteger)count
{
    if(!array)
    {
        
    }
    
    NSUInteger count = array.count;
    
    return array;
}

-(id<mconfiglibraryprotocol>)item:(NSUInteger)index;
{
    id<mconfiglibraryprotocol> item = array[index];
    
    return item;
}

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