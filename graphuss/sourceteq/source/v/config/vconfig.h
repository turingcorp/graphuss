#import "appdel.h"
#import "viewbase.h"

@class mconfig;

@interface vconfig:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mconfig *model;

@end