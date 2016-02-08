#import "vratemenu.h"

@implementation vratemenu

-(instancetype)init:(vrate*)view
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.view = view;
    self.stars = 0;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setSectionInset:UIEdgeInsetsMake(0, 25, 0, 25)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vratemenucel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;
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
    CGSize size = CGSizeMake((col.bounds.size.width - 50)/ 5.0, col.bounds.size.height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vratemenucel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    NSUInteger item = index.item;
    
    for(NSUInteger i = 0; i < 5; i++)
    {
        BOOL selected = i <= item;
        vratemenucel *cel = (vratemenucel*)[col cellForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [cel choose:selected];
    }
    
    self.stars = item + 1;
    [self.view rateselected];
}

@end