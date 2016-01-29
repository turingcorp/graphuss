#import "vpicdetailfile.h"

@implementation vpicdetailfile
{
    CGFloat itemheight;
}

-(instancetype)init:(vpicdetail*)detail model:(mpicmenufile*)model
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    self.detail = detail;
    self.model = model;
    itemheight = 60;
    
    vblur *blur = [vblur light:NO];
    vblur *minblur = [vblur light:NO];
    [minblur setAlpha:0.9];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:4];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(4, 0, 20, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vpicdetailfilecel class] forCellWithReuseIdentifier:celid];
    [collection setDataSource:self];
    [collection setDelegate:self];
    
    [self addSubview:blur];
    [self addSubview:minblur];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"blur":blur, @"col":collection, @"minblur":minblur};
    NSDictionary *metrics = @{};
    
    self.concolheight = [NSLayoutConstraint constraintWithItem:collection attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    self.conblurheight = [NSLayoutConstraint constraintWithItem:blur attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    self.conminblurheight = [NSLayoutConstraint constraintWithItem:minblur attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[minblur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[minblur]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.concolheight];
    [self addConstraint:self.conblurheight];
    [self addConstraint:self.conminblurheight];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = ([self.model count] * (itemheight + 4)) + 20;
    
    self.concolheight.constant = height;
    self.conblurheight.constant = height;
    self.conminblurheight.constant = self.bounds.size.height - height;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, itemheight);
    
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
    vpicdetailfilecel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [(id<mpicmenufileprotocol>)[self.model item:index.item] action:self.detail];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                   ^
                   {
                       [col reloadData];
                   });
}

@end