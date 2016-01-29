#import "vpicdetailpreview.h"

@implementation vpicdetailpreview

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.detail = detail;
    
    UIImage *imagedata = self.detail.pic.imagehd;
    
    vblur *blur = [vblur light:NO];
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    [scroll setAlwaysBounceHorizontal:YES];
    [scroll setAlwaysBounceVertical:YES];
    [scroll setShowsHorizontalScrollIndicator:NO];
    [scroll setShowsVerticalScrollIndicator:NO];
    [scroll setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.scroll = scroll;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setUserInteractionEnabled:NO];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setImage:imagedata];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    [scroll addSubview:image];
    [self addSubview:blur];
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"blur":blur, @"scroll":scroll, @"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    UIImage *imagedata = self.detail.pic.imagehd;
    NSUInteger previewwidth = self.bounds.size.width;
    NSUInteger previewheight = self.bounds.size.height;
    NSUInteger imagewidth = imagedata.size.width;
    NSUInteger imageheight = imagedata.size.height;
    
    if(imagewidth < previewwidth && imageheight < previewheight)
    {
        
    }
    else
    {
        
    }
}

@end