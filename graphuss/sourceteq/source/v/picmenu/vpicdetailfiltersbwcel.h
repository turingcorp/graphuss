#import "appdel.h"
#import "mpicmenufiltersbwprotocol.h"

@interface vpicdetailfiltersbwcel:UICollectionViewCell

-(void)config:(id<mpicmenufiltersbwprotocol>)model;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *label;

@end