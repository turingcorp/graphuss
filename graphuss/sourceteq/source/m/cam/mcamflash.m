#import "mcamflash.h"

@implementation mcamflash
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [[mcamflashitemoff alloc] init],
             [[mcamflashitemauto alloc] init],
             [[mcamflashitemon alloc] init],
             [[mcamflashitemtorch alloc] init],
             nil];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mcamflashitem*)item:(NSUInteger)index
{
    mcamflashitem *item = array[index];
    
    return item;
}

@end