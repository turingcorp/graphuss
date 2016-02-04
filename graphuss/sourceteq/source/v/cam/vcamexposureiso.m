#import "vcamexposureiso.h"

@implementation vcamexposureiso

-(instancetype)init:(vcamexposure*)exposure
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.exposure = exposure;
    self.isos = exposure.controller.isos;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setAlwaysBounceHorizontal:YES];
    [collection registerClass:[vcamexposureisocel class] forCellWithReuseIdentifier:celid];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:collection];

    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat height = col.bounds.size.height;
    CGSize size = CGSizeMake(height, height);

    return size;
}

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat height = col.bounds.size.height;
    CGFloat totalwidth = col.bounds.size.width;
    CGFloat margin = (totalwidth - height) / 2.0;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = [self.isos count];
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vcamexposureisocel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.isos item:index.item]];
    
    return cel;
}

@end