#import "vcamexposure.h"

@implementation vcamexposure

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
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[iso(80)]-50-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionswitch:(UISwitch*)aswitch
{
    
}

@end