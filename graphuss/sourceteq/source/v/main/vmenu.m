#import "vmenu.h"

@implementation vmenu

+(void)addto:(UIView*)view
{
    vmenu *menu = [[vmenu alloc] init];
    
    [view addSubview:menu];
    NSDictionary *views = @{@"menu":menu};
    NSDictionary *metrics = @{@"menuheight":@(menuheight)};
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(menuheight)]-0-|" options:0 metrics:metrics views:views]];
}

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    
    self.sections = [msection menu];
    vblur *blur = [vblur light];
    
    UIView *border = [[UIView alloc] init];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setUserInteractionEnabled:NO];
    [border setBackgroundColor:colormain];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(60, 50)];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setSectionInset:UIEdgeInsetsZero];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setBounces:NO];
    [collection setScrollEnabled:NO];
    [collection registerClass:[vmenucel class] forCellWithReuseIdentifier:celid];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.collection = collection;
    
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"blur":blur, @"border":border, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedupdatemenu:) name:notmenuchanged object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedupdatemenu:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [self.collection reloadData];
                       [self showmenu];
                   });
}

#pragma mark functionality

-(void)showmenu
{
    CGFloat alpha = 0;
    
    if([msession singleton].userid)
    {
        alpha = 1;
    }
    
    [UIView animateWithDuration:0.5 animations:
     ^(void)
     {
         [self setAlpha:alpha];
     }];
}

#pragma mark -
#pragma mark col del

-(CGFloat)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return (self.bounds.size.width - 180) / 2;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return [self.sections count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vmenucel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.sections item:index.item]];
    
    return cel;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    BOOL selectable = NO;
    id<msectionprotocol> item = [self.sections item:index.item];
    
    if(![item current])
    {
        selectable = [item available];
    }
    
    return selectable;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [[cmain singleton] opensection:[self.sections item:index.item] animated:YES];
}

@end