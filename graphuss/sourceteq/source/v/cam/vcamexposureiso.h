#import "appdel.h"

@class vcamexposure;
@class mcamiso;

@interface vcamexposureiso:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vcamexposure*)exposure;

@property(weak, nonatomic)vcamexposure *exposure;
@property(weak, nonatomic)mcamiso *isos;
@property(weak, nonatomic)UICollectionView *collection;
@property(nonatomic)NSInteger selected;

@end