#import "clibrary.h"

@implementation clibrary

-(instancetype)init
{
    self = [super initWithRootViewController:[[clibrarylist alloc] init]];
    
    return self;
}

@end