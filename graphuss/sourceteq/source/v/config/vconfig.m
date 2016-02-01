#import "vconfig.h"

@implementation vconfig

-(instancetype)init:(cconfig*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vspinner *spinner = [[vspinner alloc] init];
    
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spin":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spin]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[spin(80)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end