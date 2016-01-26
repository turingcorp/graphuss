#import "appdel.h"

@class vpicdetail;

@interface vpicdetailfile:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;

@end