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
    [fieldwidth setBackgroundColor:[UIColor clearColor]];
    [fieldwidth setBorderStyle:UITextBorderStyleNone];
    [fieldwidth setClearButtonMode:UITextFieldViewModeNever];
    [fieldwidth setDelegate:self];
    [fieldwidth setFont:[UIFont fontWithName:fontname size:20]];
    [fieldwidth setKeyboardAppearance:UIKeyboardAppearanceLight];
    [fieldwidth setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [fieldwidth setReturnKeyType:UIReturnKeyDone];
    [fieldwidth setSpellCheckingType:UITextSpellCheckingTypeNo];
    [fieldwidth setTextAlignment:NSTextAlignmentRight];
    [fieldwidth setTextColor:[UIColor blackColor]];
    [fieldwidth setTintColor:[UIColor blackColor]];
    [fieldwidth setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldwidth = fieldwidth;
    
    UITextField *fieldheight = [[UITextField alloc] init];
    [fieldheight setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [fieldheight setAutocorrectionType:UITextAutocorrectionTypeNo];
    [fieldheight setBackgroundColor:[UIColor clearColor]];
    [fieldheight setBorderStyle:UITextBorderStyleNone];
    [fieldheight setClearButtonMode:UITextFieldViewModeNever];
    [fieldheight setDelegate:self];
    [fieldheight setFont:[UIFont fontWithName:fontname size:20]];
    [fieldheight setKeyboardAppearance:UIKeyboardAppearanceLight];
    [fieldheight setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [fieldheight setReturnKeyType:UIReturnKeyDone];
    [fieldheight setSpellCheckingType:UITextSpellCheckingTypeNo];
    [fieldheight setTextAlignment:NSTextAlignmentRight];
    [fieldheight setTextColor:[UIColor blackColor]];
    [fieldheight setTintColor:[UIColor blackColor]];
    [fieldheight setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldheight = fieldheight;
    
    [self addSubview:blur];
    [self addSubview:fieldwidth];
    [self addSubview:fieldheight];
    
    NSDictionary *views = @{@"blur":blur, @"fieldwidth":fieldwidth, @"fieldheight":fieldheight};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[fieldwidth]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[fieldheight]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[fieldwidth(70)]-10-[fieldheight(70)]" options:0 metrics:metrics views:views]];
    
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
    [fieldwidth setText:[NSString stringWithFormat:@"%@", @(width)]];
    [fie];
}

@end