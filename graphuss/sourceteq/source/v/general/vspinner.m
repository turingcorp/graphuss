#import "vspinner.h"

@implementation vspinner
{
    timerbg *timer;
    NSInteger radius;
}

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setContentMode:UIViewContentModeCenter];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setImage:[UIImage imageNamed:@"loader"]];
    
    timer = [timerbg millis:30 delegate:self background:NO];
    [timer resume];
    
    return self;
}

#pragma mark timer del

-(void)timerbgtick
{
    radius += 8;
    
    if(radius > 360)
    {
        radius = 1;
    }
    
    [self setTransform:CGAffineTransformMakeRotation(radius * M_PI / 180.0)];
}

@end