#import "vpicdetailfiltersbw.h"

@implementation vpicdetailfiltersbw

-(instancetype)init:(vpicdetailfilters*)filters model:(mpicmenufiltersbw*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.filters = filters;
    self.model = model;
    
    vblur *blur = [vblur light:NO];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(40, 0, 40, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vpicdetailfiltersbwcel class] forCellWithReuseIdentifier:celid];
    [collection registerClass:[vpicdetailfiltersbwheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerid];
    
    [self addSubview:blur];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"blur":blur, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, 90);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = [self.model count];
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    UICollectionReusableView *reusable = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerid forIndexPath:index];
    
    return reusable;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vpicdetailfiltersbwcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item] filters:self.filters];
    
    return cel;
}

@end