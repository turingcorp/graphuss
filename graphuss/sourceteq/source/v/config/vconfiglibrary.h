#import "appdel.h"
#import "viewbase.h"

@interface vconfiglibrary:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)mconfiglibrary *model;

@end