#import "vspinner.h"

@implementation vspinner

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    
    return self;
}

#pragma mark timer del

-(void)timerbgtick
{
    
}

@end