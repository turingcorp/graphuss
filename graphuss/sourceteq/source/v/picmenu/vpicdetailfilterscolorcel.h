#import "appdel.h"
#import "mpicmenufilterscolorprotocol.h"

@interface vpicdetailfilterscolorcel:UICollectionViewCell

-(void)config:(id<mpicmenufilterscolorprotocol>)model;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIView *circle;

@end