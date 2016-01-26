#import "vpicdetailfile.h"

@implementation vpicdetailfile

-(instancetype)init:(vpicdetail*)detail model:(mpicmenufile*)model
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    self.detail = detail;
    self.model = model;
    
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

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return [self.model count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vpicdetailfile
    
    return <#expression#>
}

@end