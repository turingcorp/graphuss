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

+(vblur*)light:(BOOL)extra
{
    vblur *blur = [[vblur alloc] init];
    
    if([UIVisualEffectView class])
    {
        [blur lighteffect:extra];
    }
    else
    {
        [blur lightbackground:extra];
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

-(void)lighteffect:(BOOL)extra
{
    UIBlurEffectStyle style = UIBlurEffectStyleLight;
    
    if(extra)
    {
        style = UIBlurEffectStyleExtraLight;
    }
    
    [self geneffect:style];
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

-(void)lightbackground:(BOOL)extra
{
    CGFloat alpha = 0.96;
    
    if(extra)
    {
        alpha = 0.98;
    }
    
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:alpha]];
}

@end