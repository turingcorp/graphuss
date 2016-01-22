#import "vcammenu.h"

@implementation vcammenu
{
    CGFloat shootwidth;
}

-(instancetype)init:(vcam*)viewcam
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
 
    self.viewcam = viewcam;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.4]];
    
    UIButton *btnshoot = [[UIButton alloc] init];
    [btnshoot setImage:[UIImage imageNamed:@"shoot"] forState:UIControlStateNormal];
    [btnshoot.imageView setClipsToBounds:YES];
    [btnshoot.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btnshoot setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnshoot setClipsToBounds:YES];
    [btnshoot addTarget:self action:@selector(actionshoot:) forControlEvents:UIControlEventTouchUpInside];
    self.btnshoot = btnshoot;
    shootwidth = 90;
    
    [self addSubview:border];
    [self addSubview:btnshoot];
    
    NSDictionary *views = @{@"border":border, @"shoot":btnshoot};
    NSDictionary *metrics = @{@"shootwidth":@(shootwidth)};
    
    self.coshootleft = [NSLayoutConstraint constraintWithItem:btnshoot attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeftMargin multiplier:1 constant:1];
    [self addConstraint:self.coshootleft];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[shoot]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[shoot(shootwidth)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat margin = (width - shootwidth) / 2;
    
    self.coshootleft.constant = margin;
}

#pragma mark actions

-(void)actionshoot:(UIButton*)button
{
    [button setEnabled:NO];
    [(ccam*)self.viewcam.controller shoot];
}

@end