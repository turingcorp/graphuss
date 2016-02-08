#import "mconfig.h"

@implementation mconfig
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [[mconfiglibrary alloc] init],
             [[mconfigabout alloc] init],
             [[mconfigcontact alloc] init],
             nil];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mconfigprotocol>)item:(NSUInteger)index;
{
    id<mconfigprotocol> item = array[index];
    
    return item;
}

@end