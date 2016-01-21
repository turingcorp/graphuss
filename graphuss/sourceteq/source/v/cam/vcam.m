#import "vcam.h"

@implementation vcam

-(instancetype)init:(ccam*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vcamfinder *finder = [[vcamfinder alloc] init];
    self.finder = finder;
    
    [self addSubview:finder];
    
    NSDictionary *views = @{@"finder":finder};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[finder]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[finder]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end