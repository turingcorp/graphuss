#import "vpiclist.h"

@implementation vpiclist
{
    BOOL shouldupdate;
}

-(instancetype)init:(cpiclist*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    shouldupdate = NO;
    self.visible = YES;
    vpiclistlayout *layout = [[vpiclistlayout alloc] init];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vpiclistcel class] forCellWithReuseIdentifier:celid];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedupdatepics:) name:notreloadpics object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedupdatepics:(NSNotification*)notification
{
    shouldupdate = YES;
    
    if(self.visible)
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self update];
                       });
    }
}

#pragma mark functionality

-(void)showheader
{
    vpiclistheader *header = [[vpiclistheader alloc] init];
    self.header = header;
    
    [self addSubview:header];
    
    NSDictionary *views = @{@"header":header};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
}

#pragma mark public

-(void)update
{
    if(shouldupdate)
    {
        shouldupdate = NO;
        
        [self.header removeFromSuperview];
        [self.collection reloadData];
        [self.collection scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    }
    else
    {
        if([self.collection numberOfItemsInSection:0])
        {
            [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:-1 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        }
    }
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger items = [[mpic singleton] count];
    
    if(!items)
    {
        [self showheader];
    }
    
    return items;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vpiclistcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[[mpic singleton] item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [(cpiclist*)self.controller detailpic:index.item];
}

@end