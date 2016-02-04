#import "vcamexposure.h"

@implementation vcamexposure
{
    NSTimer *timer;
}

-(instancetype)init:(ccam*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    vblur *blur = [vblur light:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    [label setTextColor:[UIColor blackColor]];
    [label setText:NSLocalizedString(@"cam_menu_item_exposure_label", nil)];
    
    UISwitch *exposureswitch = [[UISwitch alloc] init];
    [exposureswitch setOnTintColor:colormain];
    [exposureswitch setTranslatesAutoresizingMaskIntoConstraints:NO];
    [exposureswitch addTarget:self action:@selector(actionswitch:) forControlEvents:UIControlEventValueChanged];
    self.exposureswitch = exposureswitch;
    
    UISlider *slider = [[UISlider alloc] init];
    [slider setMinimumTrackTintColor:colormain];
    [slider setMaximumTrackTintColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [slider addTarget:self action:@selector(actionslider:) forControlEvents:UIControlEventValueChanged];
    self.slider = slider;
    
    UILabel *labelmin = [[UILabel alloc] init];
    [labelmin setBackgroundColor:[UIColor clearColor]];
    [labelmin setUserInteractionEnabled:NO];
    [labelmin setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelmin setFont:[UIFont fontWithName:fontname size:15]];
    [labelmin setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [labelmin setText:NSLocalizedString(@"cam_menu_item_exposure_label_min", nil)];
    self.labelmin = labelmin;
    
    UILabel *labelmax = [[UILabel alloc] init];
    [labelmax setBackgroundColor:[UIColor clearColor]];
    [labelmax setUserInteractionEnabled:NO];
    [labelmax setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelmax setFont:[UIFont fontWithName:fontname size:15]];
    [labelmax setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [labelmax setTextAlignment:NSTextAlignmentRight];
    [labelmax setText:NSLocalizedString(@"cam_menu_item_exposure_label_max", nil)];
    self.labelmax = labelmax;
    
    UILabel *labeliso = [[UILabel alloc] init];
    [labeliso setBackgroundColor:[UIColor clearColor]];
    [labeliso setUserInteractionEnabled:NO];
    [labeliso setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeliso setFont:[UIFont fontWithName:fontname size:16]];
    [labeliso setTextColor:[UIColor blackColor]];
    [labeliso setTextAlignment:NSTextAlignmentCenter];
    [labeliso setText:NSLocalizedString(@"cam_menu_item_exposure_label_iso", nil)];
    self.labeliso = labeliso;
    
    vcamexposureiso *iso = [[vcamexposureiso alloc] init:self];
    self.iso = iso;
    
    [self addSubview:blur];
    [self addSubview:labelmin];
    [self addSubview:labelmax];
    [self addSubview:labeliso];
    [self addSubview:label];
    [self addSubview:exposureswitch];
    [self addSubview:slider];
    [self addSubview:iso];
    
    NSDictionary *views = @{@"blur":blur, @"switch":exposureswitch, @"label":label, @"iso":iso, @"slider":slider, @"min":labelmin, @"max":labelmax, @"labeliso":labeliso};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[blur(250)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-12-[switch]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-210-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[switch]-205-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[iso]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[iso(60)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[slider]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[slider]-140-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[min]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[max]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[min]-170-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[max]-170-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeliso]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labeliso]-90-|" options:0 metrics:metrics views:views]];
    
    [exposureswitch setOn:[mcamsettings singleton].exposureautomatic animated:NO];
    [slider setValue:[mcamsettings singleton].exposureduration animated:NO];
    
    if([mcamsettings singleton].exposureautomatic)
    {
        [self hidecontrols];
    }
    
    return self;
}

-(void)dealloc
{
    if(timer)
    {
        [self timeout:timer];
    }
}

#pragma mark actions

-(void)actionswitch:(UISwitch*)aswitch
{
    BOOL autoexposure = aswitch.isOn;
    
    if(autoexposure)
    {
        [self hidecontrols];
    }
    else
    {
        [self showcontrols];
    }
    
    [self updateexposure];
}

-(void)actionslider:(UISlider*)slider
{
    [self updateexposure];
}

#pragma mark functionality

-(void)timeout:(NSTimer*)atimer
{
    [timer invalidate];
    timer = nil;
    
    if([mcamsettings singleton].exposureautomatic)
    {
        [[analytics singleton] trackevent:ga_event_cam_exposure action:ga_action_automatic label:nil];
    }
    else
    {
        NSString *label = [NSString stringWithFormat:@"duration:%@, iso:%@", [[tools singleton] numbertostring:@([mcamsettings singleton].exposureduration)], [[tools singleton] numbertostring:@([mcamsettings singleton].exposureiso)]];
        
        [[analytics singleton] trackevent:ga_event_cam_exposure action:ga_action_manual label:label];
    }
}

-(void)showcontrols
{
    [self.slider setHidden:NO];
    [self.iso setHidden:NO];
    [self.labeliso setHidden:NO];
    [self.labelmax setHidden:NO];
    [self.labelmin setHidden:NO];
}

-(void)hidecontrols
{
    [self.slider setHidden:YES];
    [self.iso setHidden:YES];
    [self.labeliso setHidden:YES];
    [self.labelmax setHidden:YES];
    [self.labelmin setHidden:YES];
}

#pragma mark public

-(void)updateexposure
{
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeout:) userInfo:nil repeats:NO];
    
    [self.controller exposure:self.exposureswitch.isOn duration:self.slider.value iso:[self.controller.isos currentiso]];
}

@end