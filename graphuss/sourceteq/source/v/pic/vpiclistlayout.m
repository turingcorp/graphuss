#import "vpiclistlayout.h"

@implementation vpiclistlayout
{
    NSMutableArray *attrs;
    CGFloat padding;
    CGFloat padding2;
    CGFloat totalwidth;
    CGFloat totalheight;
    NSInteger mincols;
    NSInteger maxcols;
}

-(instancetype)init
{
    self = [super init];
    
    padding = 2;
    padding2 = padding * 2;
    mincols = 3;
    maxcols = 4;
    
    return self;
}

#pragma mark -
#pragma mark layout

-(void)prepareLayout
{
    attrs = [NSMutableArray array];
    NSMutableArray *xoff = [NSMutableArray array];
    NSMutableArray *yoff = [NSMutableArray array];
    CGFloat columnwidth;
    CGFloat imagewidth;
    NSInteger columns;
    NSInteger items = [[mpic singleton] count];
    NSInteger currentcol;
    totalwidth = self.collectionView.bounds.size.width - padding2;
    totalheight = 0;
    
    if(totalwidth < 800)
    {
        columns = mincols;
    }
    else
    {
        columns = maxcols;
    }
    
    columnwidth = totalwidth / (CGFloat)columns;
    imagewidth = columnwidth - padding2;
    
    for(NSInteger i = 0; i < columns; i++)
    {
        [xoff addObject:@((i * columnwidth) + padding)];
        [yoff addObject:@(padding)];
    }
    
    for(NSInteger i = 0; i < items; i++)
    {
        currentcol = i % columns;
        
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        CGFloat height = [[[mpic singleton] item:i] heightforwidth:imagewidth];
        CGFloat heightpadding = height + padding2;
        CGFloat x = [xoff[currentcol] floatValue];
        CGFloat y = [yoff[currentcol] floatValue];
        CGRect frame = CGRectMake(x, y, columnwidth, heightpadding);
        CGRect inset = CGRectInset(frame, padding, padding);
        CGFloat coly = y + heightpadding;
        
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexpath];
        [attr setFrame:inset];
        
        [attrs addObject:attr];
        totalheight = fmaxf(totalheight, coly);
        yoff[currentcol] = @(coly);
    }
}

-(CGSize)collectionViewContentSize
{
    CGSize size = CGSizeMake(totalwidth, totalheight);
    
    return size;
}

-(NSArray<UICollectionViewLayoutAttributes*>*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    
    for(UICollectionViewLayoutAttributes *attr in attrs)
    {
        CGRect attrrect = attr.frame;
        if(CGRectIntersectsRect(attrrect, rect))
        {
            [array addObject:attr];
        }
    }
    
    return array;
}

@end