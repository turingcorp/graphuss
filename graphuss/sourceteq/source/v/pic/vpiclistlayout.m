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
    CGFloat width = self.collectionView.bounds.size.width;
    CGFloat padding = 2;
    CGFloat columnwidth;
    CGFloat columns;
    CGFloat imagewidth;
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    
    if(width < 800)
    {
        columns = 3;
    }
    else
    {
        columns = 6;
    }
    
    columnwidth = width / columns;
    imagewidth = columnwidth - (padding * 2);
    
    for(NSInteger i = 0; i < columns; i++)
    {
        [xoff addObject:@(i * columnwidth)];
    }
    
    for(NSInteger i = 0; i < items; i++)
    {
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
    }
}

@end