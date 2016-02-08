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
    
    UIButton *buttonaccept = [[UIButton alloc] init];
    [buttonaccept setBackgroundColor:colormain];
    [buttonaccept setClipsToBounds:YES];
    [buttonaccept.layer setCornerRadius:4];
    [buttonaccept setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonaccept setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttonaccept setTitle:NSLocalizedString(@"rate_accept", nil) forState:UIControlStateNormal];
    [buttonaccept.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttonaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonaccept setHidden:YES];
    [buttonaccept addTarget:self action:@selector(actionaccept:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonaccept = buttonaccept;
    
    [self addSubview:blur];
    [self addSubview:label];
    [self addSubview:menu];
    [self addSubview:buttonsend];
    [self addSubview:buttondone];
    [self addSubview:buttonreview];
    [self addSubview:buttonaccept];
    
    NSDictionary *views = @{@"blur":blur, @"label":label, @"menu":menu, @"send":buttonsend, @"done":buttondone, @"review":buttonreview, @"accept":buttonaccept};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[send]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[label]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[label]-30-[menu(80)]-30-[send(44)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[done(130)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[review(130)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-310-[done(44)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-310-[review(44)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-310-[accept(44)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[accept]-50-|" options:0 metrics:metrics views:views]];
    
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
    [self.label setText:NSLocalizedString(@"rate_donereview", nil)];
}

-(void)actiondone:(UIButton*)button
{
    [[analytics singleton] trackevent:ga_event_rate_review action:ga_action_cancel label:nil];
    [self actionaccept:button];
}

-(void)actionreview:(UIButton*)button
{
    [[analytics singleton] trackevent:ga_event_rate_review action:ga_action_start label:nil];
 
    [tools rateapp];
    
    [self.buttonreview setHidden:YES];
    [self.buttondone setHidden:YES];
    [self.buttonaccept setHidden:NO];
    [self.label setText:NSLocalizedString(@"rate_thankyou", nil)];
}

-(void)actionaccept:(UIButton*)button
{
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark public

-(void)rateselected
{
    [self.buttonsend setHidden:NO];
}

@end