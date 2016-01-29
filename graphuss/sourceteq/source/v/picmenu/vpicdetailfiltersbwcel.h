#import "appdel.h"
#import "mpicmenufiltersbwprotocol.h"

@class vpicdetailfilters;

@interface vpicdetailfiltersbwcel:UICollectionViewCell

-(void)config:(id<mpicmenufiltersbwprotocol>)model filters:(vpicdetailfilters*)filters;

@property(weak, nonatomic)vpicdetailfilters *filters;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *label;

@end