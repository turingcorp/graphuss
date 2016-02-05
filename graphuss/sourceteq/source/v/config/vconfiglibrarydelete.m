#import "vconfiglibrarydelete.h"

@implementation vconfiglibrarydelete

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    UILabel *labeldescr = [[UILabel alloc] init];
    [labeldescr setBackgroundColor:[UIColor clearColor]];
    [labeldescr setUserInteractionEnabled:NO];
    [labeldescr setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeldescr setTextAlignment:NSTextAlignmentCenter];
    [labeldescr setNumberOfLines:0];
    [labeldescr setFont:[UIFont fontWithName:fontname size:15]];
    [labeldescr setTextColor:colormain];
    [labeldescr setText:NSLocalizedString(@"config_library_disk_descr", nil)];
    self.labeldescr = labeldescr;
    
    UILabel *labelfinalize = [[UILabel alloc] init];
    [labelfinalize setText:NSLocalizedString(@"config_library_disk_finalize", nil)];
    [labelfinalize setHidden:YES];
    self.labelfinalize = labelfinalize;
    
    UIButton *button = [[UIButton alloc] init];
    [button setHidden:YES];
    self.button = button;
    
    [self addSubview:spinner];
    [self addSubview:labeldescr];
    [self addSubview:labelfinalize];
    [self addSubview:button];
    
    NSDictionary *views = @{@"spinner":spinner, @"descr":labeldescr, @"finalize":labelfinalize, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[spinner(80)]-20-[descr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[descr]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[finalize]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[button]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[finalize]-20-[button(36)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end