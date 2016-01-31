#import "vspinner.h"

@implementation vspinner

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    vspinnerlines *lines = [[vspinnerlines alloc] init];
    
    [self addSubview:lines];
    
    NSDictionary *views = @{@"lines":lines};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lines]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lines]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark timer del

-(void)timerbgtick
{
    
}

@end