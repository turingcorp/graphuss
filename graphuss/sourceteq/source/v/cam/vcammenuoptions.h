#import "appdel.h"

@class mcam;

@interface vcammenuoptions:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mcam *model;
@property(weak, nonatomic)UIView *overview;

@end