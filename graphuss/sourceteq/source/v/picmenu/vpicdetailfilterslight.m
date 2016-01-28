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
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [border setClipsToBounds:YES];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UISlider *slider = [[UISlider alloc] init];
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [slider setTintColor:colormain];
    [slider setMaximumTrackTintColor:[UIColor blackColor]];
    [slider setMinimumTrackTintColor:[UIColor colorWithRed:0.3 green:0.6 blue:0.8 alpha:1]];
    [slider addTarget:self action:@selector(actionslider:) forControlEvents:UIControlEventValueChanged];
    [slider setMinimumValue:-0.7];
    [slider setMaximumValue:0.7];
    [slider setValue:0 animated:NO];
    self.slider = slider;
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setBackgroundColor:colormain];
    [button.layer setCornerRadius:4];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"pic_detail_fitlers_light_button", nil) forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [button addTarget:self action:@selector(actionapply:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *over = [[UIView alloc] init];
    [over setClipsToBounds:YES];
    [over setBackgroundColor:[UIColor clearColor]];
    [over setUserInteractionEnabled:NO];
    [over setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.over = over;
    
    [filters addSubview:over];
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:slider];
    [self addSubview:button];
    
    CGFloat baseside = filters.detail.bounds.size.width;
    CGFloat imagewidth = filters.detail.pic.imagehd.size.width;
    CGFloat imageheight = filters.detail.pic.imagehd.size.height;
    CGFloat max = MAX(imagewidth, imageheight);
    CGFloat ratio = max / baseside;
    CGFloat overwidth = imagewidth / ratio;
    CGFloat overheight = imageheight / ratio;
    CGFloat overleft = (baseside - overwidth) / 2.0;
    CGFloat overtop = (baseside - overheight) / 2.0;
    
    NSDictionary *views = @{@"blur":blur, @"border":border, @"slider":slider, @"over":over, @"button":button};
    NSDictionary *metrics = @{@"overwidth":@(overwidth), @"overheight":@(overheight), @"overleft":@(overleft), @"overtop":@(overtop)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[slider]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[button]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[slider]-30-[button(40)]" options:0 metrics:metrics views:views]];
    
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(overleft)-[over(overwidth)]" options:0 metrics:metrics views:views]];
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(overtop)-[over(overheight)]" options:0 metrics:metrics views:views]];
    
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
    
    [self.over setAlpha:fabs(value)];
}

@end