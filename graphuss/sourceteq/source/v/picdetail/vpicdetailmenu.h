#import "appdel.h"

@class vspinner;

@interface vpicdetailmenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)vspinner *spinner;

@end