#import "vconfiglibrary.h"

@implementation vconfiglibrary

-(instancetype)init:(cconfiglibrary*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    
    
    
    return self;
}

@end