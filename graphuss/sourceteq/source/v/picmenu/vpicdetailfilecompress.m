#import "vpicdetailfilecompress.h"

@implementation vpicdetailfilecompress
{
    NSString *labelstring;
}

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    
    self.detail = detail;
    labelstring = @"";
    
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:20], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.8]};
    NSDictionary *attrdescr = @{NSFontAttributeName:[UIFont fontWithName:fontname size:18], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.6]};
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"pic_detail_file_compress_title", nil) attributes:attrtitle]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"pic_detail_file_compress_descr", nil) attributes:attrdescr]];
    
    vblur *blur = [vblur light:NO];
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setBackgroundColor:colormain];
    [buttoncancel setClipsToBounds:YES];
    [buttoncancel.layer setCornerRadius:4];
    [buttoncancel.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttoncancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttoncancel setTitle:NSLocalizedString(@"pic_detail_file_compress_cancel", nil) forState:UIControlStateNormal];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncancel addTarget:self action:@selector(actioncancel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttoncompress = [[UIButton alloc] init];
    [buttoncompress setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.9]];
    [buttoncompress setClipsToBounds:YES];
    [buttoncompress.layer setCornerRadius:4];
    [buttoncompress.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttoncompress setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncompress setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttoncompress setTitle:NSLocalizedString(@"pic_detail_file_compress_compress", nil) forState:UIControlStateNormal];
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
    
    UILabel *labelinfo = [[UILabel alloc] init];
    [labelinfo setBackgroundColor:[UIColor clearColor]];
    [labelinfo setUserInteractionEnabled:NO];
    [labelinfo setNumberOfLines:0];
    [labelinfo setTextAlignment:NSTextAlignmentCenter];
    [labelinfo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelinfo setAttributedText:mut];
    
    [self addSubview:blur];
    [self addSubview:labelinfo];
    [self addSubview:buttoncancel];
    [self addSubview:buttoncompress];
    [self addSubview:labelvalue];
    [self addSubview:slider];
    
    NSDictionary *views = @{@"blur":blur, @"btncompress":buttoncompress, @"btncancel":buttoncancel, @"slider":slider, @"value":labelvalue, @"info":labelinfo};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[btncompress]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[btncancel]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[slider]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[value]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[info]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[info]-50-[slider]-2-[value]-45-[btncompress(44)]-20-[btncancel(44)]" options:0 metrics:metrics views:views]];
    
    [self animate:YES];
    [self print:100];
    
    return self;
}

#pragma mark actions

-(void)actionslider:(UISlider*)slider
{
    [self print:[self slidervalue]];
}

-(void)actioncompress
{
    NSInteger value = [self slidervalue];
    
    [self animate:NO];
    
    if(value < 100)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^
                       {
                           [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
                           [self.detail.controllerdetail edit_compress:value / 100.0];
                           
                           [valert alert:NSLocalizedString(@"pic_detail_file_compress_done", nil) inview:self.detail];
                       });
    }
    
    [[analytics singleton] trackevent:ga_event_pic_file_compress action:ga_action_completed label:labelstring];
}

-(void)actioncancel
{
    [[analytics singleton] trackevent:ga_event_pic_file_compress action:ga_action_cancel label:nil];
    
    [self animate:NO];
}

-(NSInteger)slidervalue
{
    return roundf(self.slider.value);
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

-(void)print:(NSInteger)value
{
    labelstring = [NSString stringWithFormat:@"%@%%", [[tools singleton] numbertostring:@(value)]];
    [self.labelvalue setText:labelstring];
}

@end