#import "vcamexposureiso.h"

@implementation vcamexposureiso
{
    BOOL trackscroll;
}

-(instancetype)init:(vcamexposure*)exposure
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    trackscroll = NO;
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
    
    self.collection = collection;
    [self addSubview:collection];

    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedreloadisos:) name:notreloadisos object:nil];
    [self initialselect];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedreloadisos:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       self.isos = self.exposure.controller.isos;
                       [self.collection reloadData];
                       [self initialselect];
                   });
}

#pragma mark functionality

-(void)initialselect
{
    if([self.isos count])
    {
        [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:self.isos.selected inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    }
}

-(void)selectiso:(NSInteger)item
{
    self.isos.selected = item;
    [self.exposure updateexposure];
}

#pragma mark -
#pragma mark col del

-(void)scrollViewWillBeginDragging:(UIScrollView*)drag
{
    trackscroll = YES;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView*)scroll
{
    trackscroll = NO;
}

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    if(trackscroll)
    {
        CGFloat leftoffset = scroll.contentOffset.x;
        
        CGPoint point = CGPointMake(leftoffset + (scroll.bounds.size.width / 2), 0);
        NSIndexPath *index = [self.collection indexPathForItemAtPoint:point];
        
        if(index)
        {
            [self selectiso:index.item];
            [self.collection selectItemAtIndexPath:index animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        }
    }
}

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

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [col scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self selectiso:index.item];
    trackscroll = NO;
}

@end