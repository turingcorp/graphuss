#import "vpicdetaileditscale.h"

@implementation vpicdetaileditscale
{
    CGFloat width;
    CGFloat height;
    CGFloat ratio;
}

+(void)askscale:(vpicdetail*)detail
{
    vpicdetaileditscale *scale = [[vpicdetaileditscale alloc] init:detail];
    [detail addSubview:scale];
    
    NSDictionary *views = @{@"scale":scale};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scale]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scale]-0-|" options:0 metrics:metrics views:views]];
    
    [scale animate:YES];
}

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    
    self.detail = detail;
    
    width = detail.pic.imagehd.size.width;
    height = detail.pic.imagehd.size.height;
    ratio = 1;
    
    vblur *blur = [vblur light:YES];

    UITextField *fieldwidth = [[UITextField alloc] init];
    [fieldwidth setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [fieldwidth setAutocorrectionType:UITextAutocorrectionTypeNo];
    [fieldwidth setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.4]];
    [fieldwidth setBorderStyle:UITextBorderStyleNone];
    [fieldwidth setClearButtonMode:UITextFieldViewModeNever];
    [fieldwidth setDelegate:self];
    [fieldwidth setFont:[UIFont fontWithName:fontname size:24]];
    [fieldwidth setKeyboardAppearance:UIKeyboardAppearanceLight];
    [fieldwidth setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [fieldwidth setReturnKeyType:UIReturnKeyDone];
    [fieldwidth setSpellCheckingType:UITextSpellCheckingTypeNo];
    [fieldwidth setTextAlignment:NSTextAlignmentCenter];
    [fieldwidth setTextColor:[UIColor blackColor]];
    [fieldwidth setTintColor:[UIColor blackColor]];
    [fieldwidth setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldwidth = fieldwidth;
    
    UITextField *fieldheight = [[UITextField alloc] init];
    [fieldheight setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [fieldheight setAutocorrectionType:UITextAutocorrectionTypeNo];
    [fieldheight setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.4]];
    [fieldheight setBorderStyle:UITextBorderStyleNone];
    [fieldheight setClearButtonMode:UITextFieldViewModeNever];
    [fieldheight setDelegate:self];
    [fieldheight setFont:[UIFont fontWithName:fontname size:24]];
    [fieldheight setKeyboardAppearance:UIKeyboardAppearanceLight];
    [fieldheight setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [fieldheight setReturnKeyType:UIReturnKeyDone];
    [fieldheight setSpellCheckingType:UITextSpellCheckingTypeNo];
    [fieldheight setTextAlignment:NSTextAlignmentCenter];
    [fieldheight setTextColor:[UIColor blackColor]];
    [fieldheight setTintColor:[UIColor blackColor]];
    [fieldheight setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldheight = fieldheight;
    
    UIButton *buttonaccept = [[UIButton alloc] init];
    [buttonaccept setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [buttonaccept.layer setCornerRadius:4];
    [buttonaccept setClipsToBounds:YES];
    [buttonaccept setTitle:NSLocalizedString(@"pic_detail_scale_btnaccept", nil) forState:UIControlStateNormal];
    [buttonaccept setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonaccept setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttonaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.buttonaccept = buttonaccept;
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setBackgroundColor:[UIColor colorWithRed:1 green:0.1 blue:0 alpha:1]];
    [buttoncancel.layer setCornerRadius:4];
    [buttoncancel setClipsToBounds:YES];
    [buttoncancel setTitle:NSLocalizedString(@"pic_detail_scale_btncancel", nil) forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.buttoncancel = buttoncancel;
    
    [self addSubview:blur];
    [self addSubview:fieldwidth];
    [self addSubview:fieldheight];
    [self addSubview:buttonaccept];
    [self addSubview:buttoncancel];
    
    NSDictionary *views = @{@"blur":blur, @"fieldwidth":fieldwidth, @"fieldheight":fieldheight, @"cancel":buttoncancel, @"accept":buttonaccept};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[fieldwidth]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[fieldheight]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[fieldwidth(70)]-0-[fieldheight(70)]-50-[accept(44)]-20-[cancel(44)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[accept]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[cancel]-50-|" options:0 metrics:metrics views:views]];
    
    [self print];
    
    return self;
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
     }];
}

-(void)print
{
    [self.fieldwidth setText:[[tools singleton] numbertostring:@(width)]];
    [self.fieldheight setText:[[tools singleton] numbertostring:@(height)]];
}

@end