#import "appdel.h"
#import "viewbase.h"

@class cconfigcontact;

@interface vconfigcontact:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)cconfigcontact *controllercontact;

@end