#import "appdel.h"
#import "viewbase.h"

@class cconfiglibrary;

@interface vconfiglibrary:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)cconfiglibrary *controllerlibrary;

@end