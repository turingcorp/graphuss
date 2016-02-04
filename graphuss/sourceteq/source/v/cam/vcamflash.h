#import "appdel.h"

@class ccam;
@class mcamflash;

@interface vcamflash:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(ccam*)controller;

@property(weak, nonatomic)ccam *controller;
@property(strong, nonatomic)mcamflash *model;

@end