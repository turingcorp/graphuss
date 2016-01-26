#import "appdel.h"

@class vpicdetail;
@class mpicmenufile;

@interface vpicdetailfile:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetail*)detail model:(mpicmenufile*)model;

@property(weak, nonatomic)vpicdetail *detail;
@property(weak, nonatomic)mpicmenufile *model;

@end