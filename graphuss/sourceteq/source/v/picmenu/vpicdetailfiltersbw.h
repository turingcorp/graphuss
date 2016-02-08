#import "appdel.h"

@class vpicdetailfilters;
@class mpicmenufiltersbw;

@interface vpicdetailfiltersbw:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetailfilters*)filters model:(mpicmenufiltersbw*)model;

@property(weak, nonatomic)vpicdetailfilters *filters;
@property(weak, nonatomic)mpicmenufiltersbw *model;

@end