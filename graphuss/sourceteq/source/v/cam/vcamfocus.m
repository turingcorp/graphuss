#import "vcamfocus.h"

@implementation vcamfocus

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    vblur *blur = [vblur light:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    [label setTextColor:[UIColor blackColor]];
    [label setText:NSLocalizedString(@"cam_menu_item_focus_label", nil)];
    
    UISwitch *focusswitch = [[UISwitch alloc] init];
    [focusswitch setOnTintColor:colormain];
    [focusswitch setTranslatesAutoresizingMaskIntoConstraints:NO];
    [focusswitch addTarget:self action:@selector(actionswitch:) forControlEvents:UIControlEventValueChanged];
    
    UISlider *slider = [[UISlider alloc] init];
    [slider setMinimumTrackTintColor:colormain];
    [slider setMaximumTrackTintColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.slider = slider;
    
    UILabel *labelmin = [[UILabel alloc] init];
    [labelmin setBackgroundColor:[UIColor clearColor]];
    [labelmin setUserInteractionEnabled:NO];
    [labelmin setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelmin setFont:[UIFont fontWithName:fontname size:15]];
    [labelmin setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [labelmin setText:NSLocalizedString(@"cam_menu_item_focus_label_min", nil)];
    self.labelmin = labelmin;
    
    UILabel *labelmax = [[UILabel alloc] init];
    [labelmax setBackgroundColor:[UIColor clearColor]];
    [labelmax setUserInteractionEnabled:NO];
    [labelmax setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelmax setFont:[UIFont fontWithName:fontname size:15]];
    [labelmax setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [labelmax setTextAlignment:NSTextAlignmentRight];
    [labelmax setText:NSLocalizedString(@"cam_menu_item_focus_label_max", nil)];
    self.labelmax = labelmax;
    
    [self addSubview:blur];
    [self addSubview:label];
    [self addSubview:focusswitch];
    [self addSubview:labelmin];
    [self addSubview:labelmax];
    [self addSubview:slider];
    
    NSDictionary *views = @{@"blur":blur, @"label":label, @"switch":focusswitch, @"slider":slider, @"min":labelmin, @"max":labelmax};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[blur(130)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-12-[switch]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-90-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[switch]-85-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[slider]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[slider]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[min]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[max]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[min]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[max]-50-|" options:0 metrics:metrics views:views]];
    
    [focusswitch setOn:[mcamsettings singleton].focusautomatic animated:NO];
    [slider setValue:[mcamsettings singleton].focusamount / 100.0 animated:NO];
    
    if([mcamsettings singleton].focusautomatic)
    {
        [self hideslider];
    }
    
    [self updatefocus];
    
    return self;
}

#pragma mark actions

-(void)actionswitch:(UISwitch*)aswitch
{
    if(aswitch.isOn)
    {
        [self hideslider];
    }
    else
    {
        [self showslider];
    }
    
    [self updatefocus];
}

-(void)actionslider:(UISlider*)slider
{
    [self updatefocus];
}

#pragma mark functionality

-(void)updatefocus
{
    if([mcamsettings singleton].focusautomatic)
    {
        
    }
    else
    {
        
    }
}

-(void)showslider
{
    [self.slider setHidden:NO];
    [self.labelmin setHidden:NO];
    [self.labelmax setHidden:NO];
}

-(void)hideslider
{
    [self.slider setHidden:YES];
    [self.labelmin setHidden:YES];
    [self.labelmax setHidden:YES];
}

@end