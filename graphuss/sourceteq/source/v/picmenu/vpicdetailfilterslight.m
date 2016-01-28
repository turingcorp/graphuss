#import "vpicdetailfilterslight.h"

typedef NS_ENUM(NSInteger, lighttype)
{
    lighttypenone,
    lighttypelight,
    lighttypedark
};

@implementation vpicdetailfilterslight
{
    lighttype type;
}

-(instancetype)init:(vpicdetailfilters*)filters
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.filters = filters;
    type = lighttypenone;
    vblur *blur = [vblur light:NO];
    
    UISlider *slider = [[UISlider alloc] init];
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [slider setTintColor:colormain];
    [slider setMaximumTrackTintColor:[UIColor blackColor]];
    [slider setMinimumTrackTintColor:colorsecond];
    [slider addTarget:self action:@selector(actionslider:) forControlEvents:UIControlEventValueChanged];
    [slider setMinimumValue:-0.7];
    [slider setMaximumValue:0.7];
    [slider setValue:0 animated:NO];
    self.slider = slider;
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setBackgroundColor:colorsecond];
    [button.layer setCornerRadius:30];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"pic_detail_fitlers_light_button", nil) forState:UIControlStateNormal];
    [button setTitle:@"Apply" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:12]];
    [button addTarget:self action:@selector(actionapply:) forControlEvents:UIControlEventTouchUpInside];
    [button.layer setBorderWidth:1];
    [button.layer setBorderColor:[UIColor blackColor].CGColor];
    
    UIImageView *preview = [[UIImageView alloc] init];
    [preview setContentMode:UIViewContentModeScaleAspectFill];
    [preview setClipsToBounds:YES];
    [preview setUserInteractionEnabled:NO];
    [preview setTranslatesAutoresizingMaskIntoConstraints:NO];
    [preview setImage:filters.detail.pic.thumb];
    [preview.layer setBorderWidth:1];
    [preview.layer setCornerRadius:4];
    [preview.layer setBorderColor:[UIColor blackColor].CGColor];
    self.preview = preview;
    
    [self addSubview:blur];
    [self addSubview:preview];
    [self addSubview:slider];
    [self addSubview:button];
    
    NSDictionary *views = @{@"blur":blur, @"slider":slider, @"preview":preview, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[preview(120)]-20-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[preview(120)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[slider]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[slider]-45-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[button(60)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionslider:(UISlider*)slider
{
    [self checkslider];
}

-(void)actionapply:(UIButton*)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [self.filters.detail.controllerdetail edit_light:self.slider.value];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [self.slider setValue:0 animated:NO];
                                          [self checkslider];
                                      });
                   });
}

#pragma mark functionality

-(void)checkslider
{
    lighttype newtype = lighttypenone;
    CGFloat value = self.slider.value;
    
    if(value > 0)
    {
        newtype = lighttypelight;
    }
    else if(value < 0)
    {
        newtype = lighttypedark;
    }
    /*
    if(type != newtype)
    {
        type = newtype;
        
        switch(type)
        {
            case lighttypenone:
                
                [self.over setBackgroundColor:[UIColor clearColor]];
                
                break;
                
            case lighttypelight:
                
                [self.over setBackgroundColor:[UIColor whiteColor]];
                
                break;
                
            case lighttypedark:
                
                [self.over setBackgroundColor:[UIColor blackColor]];
                
                break;
        }
    }
    
    [self.over setAlpha:fabs(value)];*/
}

@end