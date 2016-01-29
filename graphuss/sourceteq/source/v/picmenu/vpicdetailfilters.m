#import "vpicdetailfilters.h"

@implementation vpicdetailfilters

-(instancetype)init:(vpicdetail*)detail model:(mpicmenufilters*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.detail = detail;
    self.model = model;
    
    UIView *base = [[UIView alloc] init];
    [base setUserInteractionEnabled:NO];
    [base setClipsToBounds:YES];
    [base setTranslatesAutoresizingMaskIntoConstraints:NO];
    [base setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.98]];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setSectionInset:UIEdgeInsetsZero];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vpicdetailfilterscel class] forCellWithReuseIdentifier:celid];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:base];
    [self addSubview:collection];
    [self addSubview:border];
    
    NSDictionary *views = @{@"base":base, @"border":border, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[base]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[base(60)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-59-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[col(60)]-0-|" options:0 metrics:metrics views:views]];
    
    [collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    [self selectfilter:0];
    
    return self;
}

#pragma mark functionality

-(void)selectfilter:(NSInteger)index
{
    [(id<mpicmenufiltersprotocol>)[self.model item:index] action:self];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width / [self.model count], col.bounds.size.height);
    
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

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vpicdetailfilterscel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [self selectfilter:index.item];
}

@end