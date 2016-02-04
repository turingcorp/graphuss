#import "mcamiso.h"

@implementation mcamiso
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    NSInteger count = array.count;
    
    return count;
}

-(mcamisoitem*)item:(NSInteger)index;
{
    mcamisoitem *item = array[index];
    
    return item;
}

@end