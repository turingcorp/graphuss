#import "vpicdetailfilecompress.h"

@implementation vpicdetailfilecompress

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    
    self.detail = detail;
    
    vblur *blur = [vblur light:NO];
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setBackgroundColor:colormain];
    [buttoncancel setClipsToBounds:YES];
    [buttoncancel.layer setCornerRadius:4];
    [buttoncancel.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttoncancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttoncancel setTitle:NSLocalizedString(@"pic_detail_menu_file_compress_cancel", nil) forState:UIControlStateNormal];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncancel addTarget:self action:@selector(actioncancel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttoncompress = [[UIButton alloc] init];
    [buttoncompress setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.9]];
    [buttoncompress setClipsToBounds:YES];
    [buttoncompress.layer setCornerRadius:4];
    [buttoncompress.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttoncompress setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncompress setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttoncompress setTitle:NSLocalizedString(@"pic_detail_menu_file_compress_compress", nil) forState:UIControlStateNormal];
    [buttoncompress setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncompress addTarget:self action:@selector(actioncompress) forControlEvents:UIControlEventTouchUpInside];
    
    UISlider *slider = [[UISlider alloc] init];
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [slider setTintColor:colormain];
    [slider setMaximumTrackTintColor:colormain];
    [slider setMinimumTrackTintColor:[UIColor blackColor]];
    [slider addTarget:self action:@selector(actionslider:) forControlEvents:UIControlEventValueChanged];
    [slider setMinimumValue:0];
    [slider setMaximumValue:100];
    [slider setValue:100 animated:NO];
    self.slider = slider;
    
    UILabel *labelvalue = [[UILabel alloc] init];
    [labelvalue setBackgroundColor:[UIColor clearColor]];
    [labelvalue setFont:[UIFont fontWithName:fontboldname size:25]];
    [labelvalue setTextAlignment:NSTextAlignmentCenter];
    [labelvalue setUserInteractionEnabled:NO];
    [labelvalue setTextColor:[UIColor blackColor]];
    [labelvalue setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labelvalue = labelvalue;
    
    [self addSubview:blur];
    [self addSubview:buttoncancel];
    [self addSubview:buttoncompress];
    [self addSubview:labelvalue];
    [self addSubview:slider];
    
    NSDictionary *views = @{@"blur":blur, @"btncompress":buttoncompress, @"btncancel":buttoncancel, @"slider":slider, @"value":labelvalue};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[btncompress]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[btncancel]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[slider]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[value]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[slider]-2-[value]-45-[btncompress(44)]-20-[btncancel(44)]" options:0 metrics:metrics views:views]];
    
    [self animate:YES];
    [self print:100];
    
    return self;
}

#pragma mark actions

-(void)actionslider:(UISlider*)slider
{
    [self print:slider.value];
}

-(void)actioncompress
{
}

-(void)actioncancel
{
    [self animate:NO];
}

#pragma mark functionality

-(void)animate:(BOOL)show
{
    CGFloat alpha = 0;
    
    if(show)
    {
        alpha = 1;
    }
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [self setAlpha:alpha];
     } completion:
     ^(BOOL done)
     {
         if(!show)
         {
             [self removeFromSuperview];
         }
     }];
}

-(void)print:(CGFloat)value
{
    NSInteger intval = roundf(value);
    
    [self.labelvalue setText:[NSString stringWithFormat:@"%@%%", [[tools singleton] numbertostring:@(intval)]]];
}

@end