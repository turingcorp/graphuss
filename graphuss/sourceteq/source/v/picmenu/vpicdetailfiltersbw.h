#import "appdel.h"

@class vpicdetailfilters;

@interface vpicdetailfiltersbw:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vpicdetailfilters*)filters;

@property(weak, nonatomic)vpicdetailfilters *filters;

@end