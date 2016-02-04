#import "mcamflash.h"

@implementation mcamflash
{
    NSArray *array;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mcamitem*)item:(NSUInteger)index;
{
    mcamitem *item = array[index];
    
    return item;
}

@end