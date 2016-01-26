#import "appdel.h"

@class vspinner;
@class mpicmenu;

@interface vpicdetailmenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)vspinner *spinner;
@property(strong, nonatomic)mpicmenu *model;

@end