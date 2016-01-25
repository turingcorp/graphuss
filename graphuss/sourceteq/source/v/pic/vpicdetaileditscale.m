#import "vpicdetaileditscale.h"

@implementation vpicdetaileditscale

+(void)askscale:(vpicdetail*)detail
{
    vpicdetaileditscale *scale = [[vpicdetaileditscale alloc] init:detail];
    [detail addSubview:scale];
    
    NSDictionary *views = @{@"scale":scale};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scale]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scale]-0-|" options:0 metrics:metrics views:views]];
    
    [scale animate:YES];
}

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    
    self.detail = detail;
    
    vblur *blur = [vblur light:NO];
    
    [self addSubview:blur];
    
    NSDictionary *views = @{@"blur":blur};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)animate:(BOOL)show
{
    CGFloat alpha = 0;
    
    if(show)
    {
        alpha = 1;
    }
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [self setAlpha:alpha];
     }];
}

@end