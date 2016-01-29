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
             [[mpicmenupreview alloc] init],
             [[mpicmenuedit alloc] init],
             [[mpicmenufilters alloc] init],
             nil];
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    NSInteger count = array.count;
    
    return count;
}

-(id<mpicmenuprotocol>)item:(NSInteger)index
{
    id item = array[index];
    
    return item;
}

@end