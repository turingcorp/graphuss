#import "vpicdetailfile.h"

@implementation vpicdetailfile

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    self.detail = detail;
    
    vblur *blur = [vblur light:YES];
    
    [self addSubview:blur];
    
    NSDictionary *views = @{@"blur":blur};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

@end