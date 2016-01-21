#import "valert.h"

@implementation valert

+(void)alert:(NSString*)message inview:(UIView*)view
{
    valert *alert = [[valert alloc] init:message];
    [view addSubview:alert];
    
    NSDictionary *views = @{@"alert":alert};
    NSDictionary *metrics = @{};
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[alert]-0-|" options:0 metrics:metrics views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[alert]" options:0 metrics:metrics views:views]];
    
    [alert show];
}

-(instancetype)init:(NSString*)message
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setAlpha:0];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor colorWithRed:0.3 green:0.6 blue:0.8 alpha:1]];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setUserInteractionEnabled:NO];
    [lbl setNumberOfLines:0];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setFont:[UIFont fontWithName:fontname size:16]];
    [lbl setText:message];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[lbl]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-11-[lbl]-11-|" options:0 metrics:metrics views:views]];
    
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timeout:) userInfo:nil repeats:NO];
    
    return self;
}

#pragma mark functionality

-(void)timeout:(NSTimer*)timer
{
    [timer invalidate];
    [self hide];
}

#pragma mark public

-(void)show
{
    [UIView animateWithDuration:0.5 animations:
     ^
     {
         [self setAlpha:1];
     }];
}

-(void)hide
{
    [UIView animateWithDuration:0.5 animations:
     ^
     {
         [self setAlpha:0];
     } completion:
     ^(BOOL done)
     {
         [self removeFromSuperview];
     }];
}

@end