#import "appdel.h"

@class vpicdetail;
@class vspinner;
@class mpicmenu;

@interface vpicdetailmenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;
@property(weak, nonatomic)vspinner *spinner;
@property(strong, nonatomic)mpicmenu *model;
@property(weak, nonatomic)UICollectionView *collection;

@end