#import "vspinner.h"

@implementation vspinner

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAnimationImages:@[[UIImage imageNamed:@"spinner1"],[UIImage imageNamed:@"spinner2"],[UIImage imageNamed:@"spinner3"]]];
    [self setAnimationDuration:1];
    [self startAnimating];
    
    return self;
}

@end