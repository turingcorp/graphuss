#import "appdel.h"

@class mcamitem;

@interface vcammenuoptionscel:UICollectionViewCell

-(void)config:(mcamitem*)item;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIView *border;

@end