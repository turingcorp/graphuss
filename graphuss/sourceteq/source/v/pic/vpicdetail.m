#import "vpicdetail.h"

@implementation vpicdetail

-(instancetype)init:(cpicdetail*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

@end