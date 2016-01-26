#import "mpicmenu.h"

@implementation mpicmenu
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];

    array = [NSArray arrayWithObjects:
             [[mpicmenufile alloc] init],
             [[mpicmenuedit alloc] init],
             [[mpicmenufilters alloc] init],
             nil];
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(id<mpicmenuprotocol>)item:(NSInteger)index
{
    return array[index];
}

@end