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
    
    cam_flash type = [mcamsettings singleton].flashtype;
    self.selected = 0;
    
    NSUInteger count = array.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mcamflashitem *item = [self item:i];
        
        if([item equalstype:type])
        {
            self.selected = i;
        }
    }
    
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

-(void)selectflash:(NSUInteger)item
{
    
}

@end