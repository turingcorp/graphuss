#import "appdel.h"

@class vrate;

@interface vratemenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vrate*)view;

@property(weak, nonatomic)vrate *view;
@property(weak, nonatomic)UICollectionView *collection;
@property(nonatomic)NSUInteger stars;

@end