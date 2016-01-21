#import "vblur.h"

@implementation vblur

+(vblur*)dark;
{
    vblur *blur = [[vblur alloc] init];
    
    if([UIVisualEffectView class])
    {
        [blur darkeffect];
    }
    else
    {
        [blur darkbackground];
    }
    
    return blur;
}

+(vblur*)light;
{
    vblur *blur = [[vblur alloc] init];
    
    if([UIVisualEffectView class])
    {
        [blur lighteffect];
    }
    else
    {
        [blur lightbackground];
    }
    
    return blur;
}

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

-(void)darkeffect
{
    [self geneffect:UIBlurEffectStyleDark];
}

-(void)lighteffect
{
    [self geneffect:UIBlurEffectStyleExtraLight];
}

-(void)geneffect:(UIBlurEffectStyle)style
{
    UIVisualEffectView *blur = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
    [blur setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:blur];
    
    NSDictionary *views = @{@"blur":blur};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:nil views:views]];
}

-(void)darkbackground
{
    [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.98]];
}

-(void)lightbackground
{
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.98]];
}

@end