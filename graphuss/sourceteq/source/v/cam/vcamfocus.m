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
    
    [self addSubview:blur];
    [self addSubview:label];
    [self addSubview:focusswitch];
    
    NSDictionary *views = @{@"blur":blur, @"label":label, @"switch":focusswitch};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[blur(130)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-12-[switch]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-90-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[switch]-85-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end