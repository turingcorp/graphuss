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
    [labeldescr setText:NSLocalizedString(@"config_library_disk_in_descr", nil)];
    self.labeldescr = labeldescr;
    
    UILabel *labelfinalize = [[UILabel alloc] init];
    [labelfinalize setBackgroundColor:[UIColor clearColor]];
    [labelfinalize setTextAlignment:NSTextAlignmentCenter];
    [labelfinalize setUserInteractionEnabled:NO];
    [labelfinalize setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelfinalize setFont:[UIFont fontWithName:fontname size:20]];
    [labelfinalize setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [labelfinalize setNumberOfLines:0];
    [labelfinalize setText:NSLocalizedString(@"config_library_disk_in_finalize", nil)];
    [labelfinalize setHidden:YES];
    self.labelfinalize = labelfinalize;
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button.layer setCornerRadius:4];
    [button setBackgroundColor:colorsecond];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"config_library_disk_in_continue", nil) forState:UIControlStateNormal];
    [button setHidden:YES];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button addTarget:self action:@selector(actioncontinue:) forControlEvents:UIControlEventTouchUpInside];
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedupdatepictures:) name:notreloadpics object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedupdatepictures:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self cleanedfinalized];
                   });
}

#pragma mark actions

-(void)actioncontinue:(UIButton*)button
{
    [[cmain singleton] popToRootViewControllerAnimated:YES];
}

#pragma mark functionality

-(void)cleanedfinalized
{
    [self.spinner removeFromSuperview];
    [self.labeldescr removeFromSuperview];
    [self.labelfinalize setHidden:NO];
    [self.button setHidden:NO];
}

@end