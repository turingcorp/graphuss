#import "appdel.h"

@interface vpicdetailfilterscel:UICollectionViewCell

-(void)config:(id<mpicmenufiltersprotocol>)model;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIView *selector;

@end