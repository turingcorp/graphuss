#import "vspinner.h"

@implementation vspinner
{
    timerbg *timer;
    CGFloat rotlines;
}

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self setAnimationImages:@[[UIImage imageNamed:@"spinner1"], [UIImage imageNamed:@"spinner2"], [UIImage imageNamed:@"spinner3"]]];
    [self setAnimationDuration:0.1];
    [self startAnimating];
    
    return self;
}

@end