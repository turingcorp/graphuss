#import "appdel.h"
#import "viewbase.h"

@class vpiclistheader;

@interface vpiclist:viewbase<UICollectionViewDataSource, UICollectionViewDelegate>

-(void)update;

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)vpiclistheader *header;
@property(nonatomic)BOOL visible;

@end