#import "vpicdetaileditscale.h"

@implementation vpicdetaileditscale
{
    NSInteger width;
    NSInteger height;
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
    [fieldwidth setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
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
    [fieldwidth setClipsToBounds:YES];
    [fieldwidth.layer setCornerRadius:4];
    self.fieldwidth = fieldwidth;
    
    UITextField *fieldheight = [[UITextField alloc] init];
    [fieldheight setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [fieldheight setAutocorrectionType:UITextAutocorrectionTypeNo];
    [fieldheight setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
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
    [fieldheight setClipsToBounds:YES];
    [fieldheight.layer setCornerRadius:4];
    self.fieldheight = fieldheight;
    
    UIButton *buttonaccept = [[UIButton alloc] init];
    [buttonaccept setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [buttonaccept.layer setCornerRadius:4];
    [buttonaccept setClipsToBounds:YES];
    [buttonaccept setTitle:NSLocalizedString(@"pic_detail_scale_btnaccept", nil) forState:UIControlStateNormal];
    [buttonaccept setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonaccept setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttonaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonaccept addTarget:self action:@selector(actionaccept:) forControlEvents:UIControlEventTouchUpInside];
    [buttonaccept.titleLabel setFont:[UIFont fontWithName:fontboldname size:18]];
    [buttonaccept setHidden:YES];
    
    self.buttonaccept = buttonaccept;
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setBackgroundColor:[UIColor colorWithRed:1 green:0.1 blue:0 alpha:1]];
    [buttoncancel.layer setCornerRadius:4];
    [buttoncancel setClipsToBounds:YES];
    [buttoncancel setTitle:NSLocalizedString(@"pic_detail_scale_btncancel", nil) forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncancel addTarget:self action:@selector(actioncancel:) forControlEvents:UIControlEventTouchUpInside];
    [buttoncancel.titleLabel setFont:[UIFont fontWithName:fontboldname size:18]];
    
    self.buttoncancel = buttoncancel;
    
    UILabel *labelwidth = [[UILabel alloc] init];
    [labelwidth setBackgroundColor:[UIColor clearColor]];
    [labelwidth setUserInteractionEnabled:NO];
    [labelwidth setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelwidth setFont:[UIFont fontWithName:fontname size:17]];
    [labelwidth setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [labelwidth setText:NSLocalizedString(@"pic_detail_scale_lblwidth", nil)];
    
    UILabel *labelheight = [[UILabel alloc] init];
    [labelheight setBackgroundColor:[UIColor clearColor]];
    [labelheight setUserInteractionEnabled:NO];
    [labelheight setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelheight setFont:[UIFont fontWithName:fontname size:17]];
    [labelheight setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [labelheight setText:NSLocalizedString(@"pic_detail_scale_lblheight", nil)];
    
    UILabel *labelratio = [[UILabel alloc] init];
    [labelratio setBackgroundColor:[UIColor clearColor]];
    [labelratio setUserInteractionEnabled:NO];
    [labelratio setTextColor:colormain];
    [labelratio setFont:[UIFont fontWithName:fontboldname size:22]];
    [labelratio setTextAlignment:NSTextAlignmentRight];
    [labelratio setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labelratio = labelratio;
    
    [self addSubview:blur];
    [self addSubview:fieldwidth];
    [self addSubview:fieldheight];
    [self addSubview:labelwidth];
    [self addSubview:labelheight];
    [self addSubview:labelratio];
    [self addSubview:buttonaccept];
    [self addSubview:buttoncancel];
    
    NSDictionary *views = @{@"blur":blur, @"fieldwidth":fieldwidth, @"fieldheight":fieldheight, @"cancel":buttoncancel, @"accept":buttonaccept, @"lblratio":labelratio, @"lblwidth":labelwidth, @"lblheight":labelheight};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[fieldwidth]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[fieldheight]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[fieldwidth(55)]-50-[fieldheight(55)]-30-[accept(46)]-20-[cancel(46)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[accept]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[cancel]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[lblratio]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-135-[lblratio(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[lblwidth]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[lblheight]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-55-[lblwidth]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-160-[lblheight]" options:0 metrics:metrics views:views]];
    
    [self print];
    
    return self;
}

#pragma mark actions

-(void)actionaccept:(UIButton*)button
{
    
}

-(void)actioncancel:(UIButton*)button
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

-(void)print
{
    NSInteger displaywidth = width * ratio;
    NSInteger displayheight = height * ratio;
    
    [self.fieldwidth setText:[[tools singleton] numbertostring:@(displaywidth)]];
    [self.fieldheight setText:[[tools singleton] numbertostring:@(displayheight)]];
    [self.labelratio setText:[NSString stringWithFormat:@"x %@", [[tools singleton] numbertostring:@(ratio)]]];
    [self.buttonaccept setHidden:ratio == 1];
}

-(CGFloat)ratiofor:(UITextField*)field original:(NSInteger)original
{
    CGFloat inratio = 0;
    NSString *text = field.text;
    text = [text stringByReplacingOccurrencesOfString:@"," withString:@""];
    text = [text stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    if(text.length)
    {
        NSNumber *num = [[tools singleton] stringtonumber:text];
        NSInteger intvalue = num.integerValue;
        
        if(intvalue > 1 && intvalue != original)
        {
            inratio = intvalue / (CGFloat)original;
        }
    }
    
    return inratio;
}

-(void)computewidth
{
    CGFloat thisratio = [self ratiofor:self.fieldwidth original:width];
    
    if(thisratio > 0)
    {
        NSInteger newheight = height * thisratio;
        
        if(newheight > 1)
        {
            ratio = thisratio;
        }
    }
}

-(void)computeheight
{
    CGFloat thisratio = [self ratiofor:self.fieldheight original:height];
    
#warning "export first"
    
    if(thisratio > 0)
    {
        NSInteger newwidth = width * thisratio;
        
        if(newwidth > 1)
        {
            ratio = thisratio;
        }
    }
}

#pragma mark -
#pragma mark field del

-(void)textFieldDidBeginEditing:(UITextField*)field
{
    [self.buttonaccept setHidden:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    [field resignFirstResponder];
    
    ratio = 1;
    
    if(field == self.fieldwidth)
    {
        [self computewidth];
    }
    else
    {
        [self computeheight];
    }
    
    [self print];
    
    return YES;
}

@end