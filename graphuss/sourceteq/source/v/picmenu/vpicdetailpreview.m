#import "vpicdetailpreview.h"

@implementation vpicdetailpreview

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.detail = detail;
    
    vblur *blur = [vblur light:NO];
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    [scroll setBounces:NO];
    [scroll setShowsHorizontalScrollIndicator:NO];
    [scroll setShowsVerticalScrollIndicator:NO];
    [scroll setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.scroll = scroll;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setUserInteractionEnabled:NO];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image.layer setBorderWidth:1];
    [image.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.4].CGColor];
    [image setImage:self.detail.pic.imagehd];
    self.image = image;
    
    [scroll addSubview:image];
    [self addSubview:blur];
    [self addSubview:scroll];
    
    self.conimagetop = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:scroll attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    self.conimageleft = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:scroll attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    self.conimagewidth = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    self.conimageheight = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    
    NSDictionary *views = @{@"blur":blur, @"scroll":scroll, @"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [scroll addConstraint:self.conimagetop];
    [scroll addConstraint:self.conimageleft];
    [scroll addConstraint:self.conimagewidth];
    [scroll addConstraint:self.conimageheight];
    
    return self;
}

-(void)layoutSubviews
{
    UIImage *imagedata = self.detail.pic.imagehd;
    NSUInteger previewwidth = self.bounds.size.width;
    NSUInteger previewheight = self.bounds.size.height;
    NSUInteger imagewidth = imagedata.size.width;
    NSUInteger imageheight = imagedata.size.height;
    
    if(imagewidth < previewwidth && imageheight < previewheight)
    {
        self.conimagetop.constant = (previewheight - imageheight) / 2.0;
        self.conimageleft.constant = (previewwidth - imagewidth) / 2.0;
        self.conimagewidth.constant = imagewidth;
        self.conimageheight.constant = imageheight;
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.image setContentMode:UIViewContentModeCenter];
                       });
    }
    else
    {
        CGFloat scrollwidth;
        CGFloat scrollheight;
        CGFloat deltax = imagewidth / (CGFloat)previewwidth;
        CGFloat deltay = imageheight / (CGFloat)previewheight;
        CGFloat deltamax = fmax(deltax, deltay);
        
        CGFloat top = 2;
        
        if(deltamax > top)
        {
            CGFloat howmuch = deltamax / top;
            scrollwidth = imagewidth / howmuch;
            scrollheight = imageheight / howmuch;
        }
        else
        {
            scrollwidth = imagewidth;
            scrollheight = imageheight;
        }
        
        self.conimagewidth.constant = scrollwidth;
        self.conimageheight.constant = scrollheight;
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.scroll setContentSize:CGSizeMake(scrollwidth, scrollheight)];
                       });
    }
    
    [super layoutSubviews];
}

@end