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
    
    rotlines = 0;
    
    vspinnerlines *lines = [[vspinnerlines alloc] init];
    self.lines = lines;
    
    [self addSubview:lines];
    
    NSDictionary *views = @{@"lines":lines};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lines]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lines]-0-|" options:0 metrics:metrics views:views]];
    
    timer = [timerbg millis:60 delegate:self background:YES];
    [timer resume];
    
    return self;
}

#pragma mark timer del

-(void)timerbgtick
{
    rotlines += 0.2;
    
    if(rotlines > 6.28319)
    {
        rotlines = 0;
    }
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
//                       [self.lines setTransform:CGAffineTransformMakeRotation(rotlines)];
                   });
}

@end