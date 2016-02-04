#import "appdel.h"
#import "viewbase.h"

@interface vconfig:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mconfig *model;

@end