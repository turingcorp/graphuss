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
    
    for(NSUInteger i = 0; i < totalisos; i++)
    {
        
    }
    
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