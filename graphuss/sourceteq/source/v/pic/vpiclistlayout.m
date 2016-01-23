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
    
    if(width < 800)
    {
        columns = 3;
    }
    else
    {
        columns = 6;
    }
    
    columnwidth = width / columns;
    
    for(NSInteger i = 0; i < columns; i++)
    {
        [xoff addObject:@(i * columnwidth)];
    }
}

@end