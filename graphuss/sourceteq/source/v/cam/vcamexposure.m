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
    
    vcamexposureiso *iso = [[vcamexposureiso alloc] init:self];
    self.iso = iso;
    
    [self addSubview:blur];
    [self addSubview:label];
    [self addSubview:exposureswitch];
    [self addSubview:iso];
    
    NSDictionary *views = @{@"blur":blur, @"switch":exposureswitch, @"label":label, @"iso":iso};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[blur(250)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-12-[switch]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-210-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[switch]-205-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[iso]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[iso(60)]-50-|" options:0 metrics:metrics views:views]];
    
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
    BOOL autofocus = aswitch.isOn;
    [[mcamsettings singleton] focusauto:autofocus];
    
    if(autofocus)
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
//    [[mcamsettings singleton] focusamount:slider.value];
    
    [self updateexposure];
}

#pragma mark functionality

-(void)timeout:(NSTimer*)atimer
{
    [timer invalidate];
    timer = nil;
    
    if([mcamsettings singleton].focusautomatic)
    {
        [[analytics singleton] trackevent:ga_event_cam_focus action:ga_action_automatic label:nil];
    }
    else
    {
        NSString *label = [[tools singleton] numbertostring:@(self.slider.value)];
        
        [[analytics singleton] trackevent:ga_event_cam_focus action:ga_action_manual label:label];
    }
}

-(void)showcontrols
{
    [self.slider setHidden:NO];
    [self.labelmin setHidden:NO];
    [self.labelmax setHidden:NO];
}

-(void)hidecontrols
{
    [self.slider setHidden:YES];
    [self.labelmin setHidden:YES];
    [self.labelmax setHidden:YES];
}

#pragma mark public

-(void)updateexposure
{
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeout:) userInfo:nil repeats:NO];
    
    CGFloat focusamount;
    
    if([mcamsettings singleton].focusautomatic)
    {
        focusamount = -1;
    }
    else
    {
        focusamount = self.slider.value;
    }
    
    [self.controller changefocus:focusamount];
}

@end