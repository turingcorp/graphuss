#import "vcamflash.h"

@implementation vcamflash

-(instancetype)init:(ccam*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    return self;
}

@end