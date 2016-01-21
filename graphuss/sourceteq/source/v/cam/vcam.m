#import "vcam.h"

@implementation vcam

-(instancetype)init:(ccam*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    
    return self;
}

@end