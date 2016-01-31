#import "appdel.h"

@class vpicdetailfilters;
@class mpicmenufilterscolor;

@interface vpicdetailfilterscolor:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetailfilters*)filters model:(mpicmenufilterscolor*)model;

@property(weak, nonatomic)vpicdetailfilters *filters;
@property(weak, nonatomic)mpicmenufilterscolor *model;

@end