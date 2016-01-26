#import "vpicdetailfilecel.h"

@implementation vpicdetailfilecel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:fontname size:18]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)config:(id<mpicmenufileprotocol>)model
{
    [self.label setText:[model title]];
}

@end