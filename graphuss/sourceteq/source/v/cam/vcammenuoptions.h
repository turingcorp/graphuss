#import "appdel.h"

@class mcam;
@class vcam;

@interface vcammenuoptions:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vcam*)viewcam;

@property(strong, nonatomic)mcam *model;
@property(weak, nonatomic)vcam *viewcam;
@property(weak, nonatomic)UIView *overview;

@end