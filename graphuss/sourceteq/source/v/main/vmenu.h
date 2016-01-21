#import "appdel.h"

@class msection;

@interface vmenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

+(void)addto:(UIView*)view;

@property(strong, nonatomic)msection *sections;
@property(weak, nonatomic)UICollectionView *collection;

@end