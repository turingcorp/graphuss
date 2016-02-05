#import "vrate.h"

@implementation vrate

-(instancetype)init:(crate*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vblur *blur = [vblur light:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:28]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:NSLocalizedString(@"rate_descr", nil)];
    [label setTextColor:[UIColor blackColor]];
    [label setNumberOfLines:0];
    
    vratemenu *menu = [[vratemenu alloc] init:self];
    self.menu = menu;
    
    UIButton *buttonsend = [[UIButton alloc] init];
    [buttonsend setBackgroundColor:colormain];
    [buttonsend.layer setCornerRadius:4];
    [buttonsend setClipsToBounds:YES];
    [buttonsend setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonsend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonsend setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttonsend setTitle:NSLocalizedString(@"rate_send", nil) forState:UIControlStateNormal];
    [buttonsend.titleLabel setFont:[UIFont fontWithName:fontboldname size:18]];
    [buttonsend addTarget:self action:@selector(actionsend) forControlEvents:UIControlEventTouchUpInside];
    [buttonsend setHidden:YES];
    self.buttonsend = buttonsend;
    
    [self addSubview:blur];
    [self addSubview:label];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"blur":blur, @"label":label, @"menu":menu, @"send":buttonsend};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[send]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[label]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[label]-30-[menu(80)]-30-[send(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionsend
{
    NSString *label = [tools];
    
    [[analytics singleton] trackevent:ga_event_rate action:ga_action_completed label:label];
}

#pragma mark public

-(void)rateselected
{
    [self.buttonsend setHidden:NO];
}

@end