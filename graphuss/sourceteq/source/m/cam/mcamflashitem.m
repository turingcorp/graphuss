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

-(BOOL)equalstype:(NSInteger)type
{
    return NO;
}

@end