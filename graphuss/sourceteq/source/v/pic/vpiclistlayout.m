#import "vpiclistlayout.h"

@implementation vpiclistlayout
{
    NSMutableArray *attrs;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)prepareLayout
{
    attrs = [NSMutableArray array];
    NSMutableArray *xoff = [NSMutableArray array];
    NSMutableArray *yoff = [NSMutableArray array];
    CGFloat width = self.collectionView.bounds.size.width;
    CGFloat padding = 2;
    CGFloat padding2 = padding * 2;
    CGFloat columnwidth;
    CGFloat imagewidth;
    NSInteger columns;
    NSInteger items = [[mpic singleton] count];
    NSInteger currentcol;
    
    if(width < 800)
    {
        columns = 3;
    }
    else
    {
        columns = 6;
    }
    
    columnwidth = width / (CGFloat)columns;
    imagewidth = columnwidth - padding2;
    
    for(NSInteger i = 0; i < columns; i++)
    {
        [xoff addObject:@(i * columnwidth)];
        [yoff addObject:@0];
    }
    
    for(NSInteger i = 0; i < items; i++)
    {
        currentcol = i % columns;
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        CGFloat height = [[[mpic singleton] item:i] heightforwidth:width];
        CGFloat heightpadding = height + padding2;
        CGRect frame = CGRectMake([xoff[currentcol] floatValue], 0, columnwidth, heightpadding);
        CGRect inset = CGRectInset(frame, padding, padding);
    }
}

@end