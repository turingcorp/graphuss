#import "appdel.h"

@class vpicdetail;
@class mpicmenuedit;

@interface vpicdetailedit:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetail*)detail model:(mpicmenuedit*)model;

@property(weak, nonatomic)vpicdetail *detail;
@property(weak, nonatomic)mpicmenuedit *model;

@end