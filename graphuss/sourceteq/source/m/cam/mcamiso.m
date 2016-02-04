#import "mcamiso.h"

@implementation mcamiso
{
    NSMutableArray *array;
}

-(instancetype)init:(AVCaptureDevice*)device
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    AVCaptureDeviceFormat *format = device.activeFormat;
    self.maxiso = format.maxISO;
    self.miniso = format.minISO;
    NSUInteger totalisos = 10;
    
    CGFloat sumisos = self.maxiso - self.miniso;
    CGFloat deltaiso = sumisos / (CGFloat)totalisos;
    CGFloat currentiso = self.miniso;
    
    for(NSUInteger i = 0; i < totalisos; i++)
    {
        mcamisoitem *item = [[mcamisoitem alloc] init:currentiso];
        [array addObject:item];
        
        currentiso += deltaiso;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notreloadisos object:nil];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
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