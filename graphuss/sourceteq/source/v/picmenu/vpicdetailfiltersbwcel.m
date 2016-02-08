#import "vpicdetailfiltersbwcel.h"

@implementation vpicdetailfiltersbwcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:16]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    self.label = label;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image.layer setBorderWidth:1];
    [image.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.5].CGColor];
    self.image = image;
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:colorsecond];
    [button setClipsToBounds:YES];
    [button.layer setCornerRadius:4];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"pic_detail_filters_menu_black_white_button", nil) forState:UIControlStateNormal];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [button addTarget:self action:@selector(actionapply:) forControlEvents:UIControlEventTouchUpInside];
    self.button = button;
    
    [self addSubview:label];
    [self addSubview:image];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"image":image, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image(90)]-10-[label]-0-[button(100)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-24-[button]-24-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark actions

-(void)actionapply:(UIButton*)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       id<mgraphicsfilterprotocol> filter = [self.model filter];
                       NSString *name = [self.model title];
                       
                       [self.filters.detail.controllerdetail edit_filter:filter];
                       [[analytics singleton] trackevent:ga_event_pic_filter_blackandwhite action:ga_action_completed label:name];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [[cmain singleton] popViewControllerAnimated:YES];
                                      });
                   });
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.9]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:1]];
        [self.button setHidden:NO];
    }
    else
    {
        [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.1]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [self.button setHidden:YES];
    }
}

#pragma mark public

-(void)config:(id<mpicmenufiltersbwprotocol>)model filters:(vpicdetailfilters*)filters
{
    self.filters = filters;
    self.model = model;
    [self.image setImage:nil];
    [self.label setText:[model title]];
    [self hover];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       mgraphicsfilterbwbasic *filter = [model filter];
                       UIImage *image = [mgraphics image:filters.detail.pic.thumb add:filter];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [self.image setImage:image];
                                      });
                   });
}

@end