#import "vpicdetailpreview.h"

@implementation vpicdetailpreview

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.detail = detail;
    
    UIImage *image = self.detail.pic.imagehd;
    
    vblur *blur = [vblur light:NO];
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    self.scroll = scroll;
    
    UIImageView *image = [[UIImageView alloc] init];
    self.image = image;
    
    [scroll addSubview:image];
    [self addSubview:blur];
    [self addSubview:scroll];
    
    UIImage *image = self.detail.pic.imagehd;
    
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
    
    
    
    NSUInteger previewwidth = self.bounds.size.width;
    NSUInteger previewheight = self.bounds.size.height;
    NSUInteger imagewidth = image.size.width;
    NSUInteger imageheight = image.size.height;
    
    if()
}

@end