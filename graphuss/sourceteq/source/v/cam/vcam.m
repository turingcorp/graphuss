#import "vcam.h"

@implementation vcam
{
    BOOL marginfirsttime;
}

-(instancetype)init:(ccam*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    marginfirsttime = YES;
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    vcammenu *menu = [[vcammenu alloc] init:self];
    [menu setUserInteractionEnabled:NO];
    self.menu = menu;
    
    vcamfinder *finder = [[vcamfinder alloc] init];
    self.finder = finder;
    
    vcampreview *preview = [[vcampreview alloc] init];
    self.preview = preview;
    
    vcammenuoptions *options = [[vcammenuoptions alloc] init:self];
    self.options = options;
    [self.options setHidden:YES];
    
    [self addSubview:finder];
    [self addSubview:spinner];
    [self addSubview:preview];
    [self addSubview:options];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"spinner":spinner, @"menu":menu, @"finder":finder, @"preview":preview, @"options":options};
    NSDictionary *metrics = @{};
    
    self.comenuheight = [NSLayoutConstraint constraintWithItem:menu attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    self.cofinderheight = [NSLayoutConstraint constraintWithItem:finder attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    self.copreviewheight = [NSLayoutConstraint constraintWithItem:preview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    self.copreviewmargin = [NSLayoutConstraint constraintWithItem:preview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:1];
    
    [self addConstraint:self.comenuheight];
    [self addConstraint:self.cofinderheight];
    [self addConstraint:self.copreviewheight];
    [self addConstraint:self.copreviewmargin];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[spinner(80)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[finder]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[finder]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[preview]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[options]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[options]-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat previewheight;
    
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        previewheight = width * 3.0 / 4.0;
    }
    else
    {
         previewheight = width * 4.0 / 3.0;
    }
    
    CGFloat menuheight = height - previewheight;
    
    if(menuheight < 80)
    {
        menuheight = 80;
    }
    
    self.comenuheight.constant = menuheight;
    self.cofinderheight.constant = previewheight;
    self.copreviewheight.constant = previewheight;
    
    if(marginfirsttime)
    {
        self.copreviewmargin.constant = previewheight;
        marginfirsttime = NO;
    }
    
    [super layoutSubviews];
}

#pragma mark functionality

-(void)animatepreviewshow
{
    self.copreviewmargin.constant = 0;
    
    [UIView animateWithDuration:0.2 animations:
     ^(void)
     {
         [self layoutIfNeeded];
     }];
}

-(void)animatepreviewhide
{
    self.copreviewmargin.constant = self.copreviewheight.constant;
    
    [UIView animateWithDuration:0.4 animations:
     ^(void)
     {
         [self layoutIfNeeded];
     } completion:
     ^(BOOL done)
     {
         [self.preview clearimage];
     }];
}

#pragma mark public

-(void)addfinder:(AVCaptureSession*)session
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.spinner removeFromSuperview];
                       [self.finder startsession:session];
                       [self.menu setUserInteractionEnabled:YES];
                   });
}

-(void)takepicture
{
    [self.menu setUserInteractionEnabled:NO];
    [(ccam*)self.controller shoot];
    [self animatepreviewshow];
}

-(void)picturetaken:(UIImage*)image
{
    [self.preview showimage:image];
}

-(void)restart
{
    [[analytics singleton] trackevent:ga_event_shoot action:ga_action_restart label:nil];
    [self animatepreviewhide];
    [self.menu refresh];
}

-(void)optionsshowed:(BOOL)showed
{
    [self.options setHidden:!showed];
}

@end