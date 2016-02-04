#import "mcamflashitem.h"

@implementation mcamflashitem

-(instancetype)init
{
    self = [super init];
    
    self.name = @"";
    
    return self;
}

#pragma mark public

-(void)selected:(ccam*)controller
{
}

-(BOOL)equalstype:(cam_flash)type
{
    return NO;
}

@end