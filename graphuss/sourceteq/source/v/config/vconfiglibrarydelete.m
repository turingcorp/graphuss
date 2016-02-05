#import "vconfiglibrarydelete.h"

@implementation vconfiglibrarydelete

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    [self addSubview:spinner];
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
 
#warning "here"
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[spinner(80)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end