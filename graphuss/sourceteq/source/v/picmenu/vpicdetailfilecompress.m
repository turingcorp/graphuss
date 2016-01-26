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
    
    [self addSubview:blur];
    [self addSubview:buttoncancel];
    [self addSubview:buttoncompress];
    
    NSDictionary *views = @{@"blur":blur, @"btncompress":buttoncompress, @"btncancel":buttoncancel};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[btncompress]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[btncancel]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-300-[btncompress(44)]-20-[btncancel(44)]" options:0 metrics:metrics views:views]];
    
    [self animate:YES];
    
    return self;
}

#pragma mark actions

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

@end