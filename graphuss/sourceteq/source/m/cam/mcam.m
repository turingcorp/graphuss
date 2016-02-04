#import "mcam.h"

@implementation mcam
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];

    array = [NSArray arrayWithObjects:
             [[mcamitemfocus alloc] init],
             [[mcamitemexposure alloc] init],
             [[mcamitemflash alloc] init],
             nil];
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    NSInteger count = array.count;
    
    return count;
}

-(mcamitem*)item:(NSInteger)item
{
    mcamitem *camitem = array[item];
    
    return camitem;
}

@end