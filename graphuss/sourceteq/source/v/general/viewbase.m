#import "viewbase.h"

@implementation viewbase

-(instancetype)init:(UIViewController*)controller
{
    self = [super init];
    
    self.controller = controller;
    
    return self;
}

@end