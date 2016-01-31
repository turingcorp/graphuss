#import "appdel.h"
#import "mpicmenufilterscolorprotocol.h"

@interface vpicdetailfilterscolorcel:UICollectionViewCell

-(void)config:(id<mpicmenufilterscolorprotocol>)model filters:(vpicdetailfilters*)filters;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIView *circle;

@end