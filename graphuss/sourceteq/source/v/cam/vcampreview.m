#import "vcampreview.h"

@implementation vcampreview

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    vblur *blur = [vblur light:YES];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *imageview = [[UIImageView alloc] init];
    [imageview setClipsToBounds:YES];
    [imageview setContentMode:UIViewContentModeScaleAspectFit];
    [imageview setUserInteractionEnabled:NO];
    [imageview setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.imageview = imageview;
    
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:imageview];
    
    NSDictionary *views = @{@"blur":blur, @"border":border, @"image":imageview};
    NSDictionary *metrics = @{@"borderheight":@3};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(borderheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)showimage:(UIImage*)image
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.imageview setImage:image];
                   });
}

-(void)clearimage
{
    [self.imageview setImage:nil];
}

@end