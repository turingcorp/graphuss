#import "appdel.h"

@class vpicdetailfilters;

@interface vpicdetailfiltersbw:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetailfilters*)filters model:(mpicmenufiltersbw*)model;

@property(weak, nonatomic)vpicdetailfilters *filters;
@property(weak, nonatomic)mpicmenufiltersbw *model;

@end