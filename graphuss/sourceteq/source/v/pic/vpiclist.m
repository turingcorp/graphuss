#import "vpiclist.h"

@implementation vpiclist

-(instancetype)init:(cpiclist*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

@end