#import "appdel.h"

@interface vpicdetailmenucel:UICollectionViewCell

-(void)config:(id<mpicmenuprotocol>)model;

@property(weak, nonatomic)UIView *base;
@property(weak, nonatomic)UILabel *label;

@end