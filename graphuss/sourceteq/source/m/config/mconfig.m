#import "mconfig.h"

@implementation mconfig
{
    NSArray *array;
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