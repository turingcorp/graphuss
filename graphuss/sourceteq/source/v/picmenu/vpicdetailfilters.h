#import "appdel.h"

@class mpicmenufilters;

@interface vpicdetailfilters:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetail*)detail model:(mpicmenufilters*)model;

@property(weak, nonatomic)vpicdetail *detail;
@property(weak, nonatomic)mpicmenufilters *model;

@end