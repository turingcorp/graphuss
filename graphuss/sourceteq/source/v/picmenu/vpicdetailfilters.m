#import "vpicdetailfilters.h"

@implementation vpicdetailfilters

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

@end