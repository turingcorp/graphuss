#import "vcamexposureiso.h"

@implementation vcamexposureiso

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vcamexposureisocel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    
    return cel;
}

@end