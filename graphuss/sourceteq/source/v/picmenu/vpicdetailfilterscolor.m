#import "vpicdetailfilterscolor.h"

@implementation vpicdetailfilterscolor
{
    NSUInteger itemsize;
    NSInteger selected;
    BOOL trackscroll;
}

-(instancetype)init:(vpicdetailfilters*)filters model:(mpicmenufilterscolor*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.filters = filters;
    self.model = model;
    selected = 0;
    trackscroll = NO;
    
    vblur *blur = [vblur light:NO];

    itemsize = 170;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(itemsize, itemsize)];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vpicdetailfilterscolorcel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setBackgroundColor:colorsecond];
    [button setTitle:NSLocalizedString(@"pic_detail_filters_menu_colors_button", nil) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [button.layer setCornerRadius:4];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button addTarget:self action:@selector(actionadd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:blur];
    [self addSubview:collection];
    [self addSubview:button];
    
    NSDictionary *views = @{@"blur":blur, @"col":collection, @"button":button};
    NSDictionary *metrics = @{@"itemheight":@(itemsize)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-120-[button]-120-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[col(itemheight)]-40-[button(40)]-40-|" options:0 metrics:metrics views:views]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 100), dispatch_get_main_queue(),
                   ^
                   {
                       [collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:selected inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                   });
    
    return self;
}

#pragma mark actions

-(void)actionadd:(UIButton*)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       id<mpicmenufilterscolorprotocol> model = [self.model item:selected];
                       id<mgraphicsfilterprotocol> filter = [model filter];
                       NSString *name = [model title];
                       
                       [self.filters.detail.controllerdetail edit_filter:filter];
                       [[analytics singleton] trackevent:ga_event_pic_filter_color action:ga_action_completed label:name];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [[cmain singleton] popViewControllerAnimated:YES];
                                      });
                   });
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
            selected = index.item;
            [self.collection selectItemAtIndexPath:index animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        }
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat margin = (col.bounds.size.width - itemsize) / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
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
    vpicdetailfilterscolorcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item] filters:self.filters];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [col scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    selected = index.item;
    trackscroll = NO;
}

@end