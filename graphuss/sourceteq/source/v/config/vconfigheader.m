#import "vconfigheader.h"

@implementation vconfigheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFont:[UIFont fontWithName:fontboldname size:18]];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextColor:colormain];
    [label setText:NSLocalizedString(@"config_title", nil)];
    [label setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-25-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end