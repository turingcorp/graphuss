#import "vpicdetailedit.h"

@implementation vpicdetailedit
{
    CGFloat rotation;
}

-(instancetype)init:(vpicdetail*)detail model:(mpicmenuedit*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.detail = detail;
    self.model = model;
    rotation = 0;
    
    UIBarButtonItem *itemrotateleft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actionrotateleft)];
    
    UIBarButtonItem *itemflex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *itemrotateright = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actionrotateright)];
    
    UIBarButtonItem *itemscale = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(actionscale)];
    
    UIBarButtonItem *itemcrop = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(actioncrop)];
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setTranslucent:YES];
    [toolbar setTintColor:colormain];
    [toolbar setItems:@[itemrotateleft, itemflex, itemrotateright, itemflex, itemscale, itemflex, itemcrop] animated:NO];
    [toolbar setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setSectionInset:UIEdgeInsetsZero];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vpicdetaileditcel class] forCellWithReuseIdentifier:celid];
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionrotateleft
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    [self rotate:NO];
}

-(void)actionrotateright
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    [self rotate:YES];
}

-(void)actionscale
{
    [vpicdetaileditscale askscale:self.detail];
}

-(void)actioncrop
{
    
}

#pragma mark functionality

-(void)rotate:(CGFloat)clockwise
{
    CGFloat degrees = -90;
    
    if(clockwise)
    {
        degrees = 90;
    }
    
    rotation += degrees * M_PI / 180.0;
    CGAffineTransform transform = CGAffineTransformMakeRotation(rotation);
    
    [UIView animateWithDuration:0.3 animations:
     ^
     {
         [self.detail.image setTransform:transform];
         [self.detail.image setNeedsDisplay];
         [self.detail.image layoutIfNeeded];

     } completion:
     ^(BOOL done)
     {
         if(clockwise)
         {
             [self.detail.controllerdetail edit_rotateright];
         }
         else
         {
             [self.detail.controllerdetail edit_rotateleft];
         }
     }];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    return CGSizeMake(col.bounds.size.width / [self.model count], col.bounds.size.height);
}

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
    vpicdetaileditcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

@end