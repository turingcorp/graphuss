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
    self.label = label;
    
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
    [buttonsend addTarget:self action:@selector(actionsend:) forControlEvents:UIControlEventTouchUpInside];
    [buttonsend setHidden:YES];
    self.buttonsend = buttonsend;
    
    UIButton *buttondone = [[UIButton alloc] init];
    [buttondone setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [buttondone setClipsToBounds:YES];
    [buttondone.layer setCornerRadius:4];
    [buttondone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttondone setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttondone setTitle:NSLocalizedString(@"rate_done", nil) forState:UIControlStateNormal];
    [buttondone.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttondone setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttondone setHidden:YES];
    [buttondone addTarget:self action:@selector(actiondone:) forControlEvents:UIControlEventTouchUpInside];
    self.buttondone = buttondone;
    
    UIButton *buttonreview = [[UIButton alloc] init];
    [buttonreview setBackgroundColor:colormain];
    [buttonreview setClipsToBounds:YES];
    [buttonreview.layer setCornerRadius:4];
    [buttonreview setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonreview setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttonreview setTitle:NSLocalizedString(@"rate_review", nil) forState:UIControlStateNormal];
    [buttonreview.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttonreview setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonreview setHidden:YES];
    [buttonreview addTarget:self action:@selector(actionreview:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonreview = buttonreview;
    
    [self addSubview:blur];
    [self addSubview:label];
    [self addSubview:menu];
    [self addSubview:buttonsend];
    [self addSubview:buttondone];
    [self addSubview:buttonreview];
    
    NSDictionary *views = @{@"blur":blur, @"label":label, @"menu":menu, @"send":buttonsend, @"done":buttondone, @"review":buttonreview};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[send]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[label]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[label]-30-[menu(80)]-30-[send(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[done(130)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[review(130)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-250-[done(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-250-[review(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionsend:(UIButton*)button
{
    NSString *label = [[tools singleton] numbertostring:@(self.menu.stars)];
    [[analytics singleton] trackevent:ga_event_rate action:ga_action_completed label:label];
    
    [self.menu setHidden:YES];
    [self.buttonsend setHidden:YES];
    [self.buttondone setHidden:NO];
    [self.buttonreview setHidden:NO];
    [self.label setText:NSLocalizedString(@"rate_done", nil)];
}

-(void)actiondone:(UIButton*)button
{
    
}

-(void)actionreview:(UIButton*)button
{
    
}

#pragma mark public

-(void)rateselected
{
    [self.buttonsend setHidden:NO];
}

@end