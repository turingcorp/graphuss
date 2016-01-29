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
    self.scroll = scroll;
    
    [self addSubview:blur];
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"blur":blur, @"scroll":scroll};
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
    
    
}

@end