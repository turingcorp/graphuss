#import "appdel.h"
#import "viewbase.h"

@interface vpiclist:viewbase<UICollectionViewDataSource, UICollectionViewDelegate>

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)vpiclistheader *header;

@end