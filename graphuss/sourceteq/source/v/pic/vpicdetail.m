#import "vpicdetail.h"

@implementation vpicdetail

-(instancetype)init:(cpicdetail*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    vpicdetailmenu *menu = [[vpicdetailmenu alloc] init];
    self.menu = menu;
    
    [self addSubview:image];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"image":image, @"menu":menu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-[menu(80)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    
    [self showedit];
    
    return self;
}

#pragma mark public

-(void)loadpic:(mpicitem*)pic
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       self.pic = pic;
                       
                       if(!self.image.image)
                       {
                           UIImage *image = [UIImage imageWithContentsOfFile:[[mpic singleton] fileforimage:pic.name]];
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [self.image setImage:image];
                                          });
                       }
                   });
}

-(void)showedit
{
    [self.overview removeFromSuperview];
    
    vpicdetailedit *edit = [[vpicdetailedit alloc] init:self];
    self.overview = edit;
    
    [self addSubview:edit];
    
    NSDictionary *views = @{@"edit":edit, @"menu":self.menu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[edit]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[edit(60)]-0-[menu]" options:0 metrics:metrics views:views]];
}

@end