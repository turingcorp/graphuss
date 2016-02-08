#import "appdel.h"

@class mcamflashitem;

@interface vcamflashcel:UICollectionViewCell

-(void)config:(mcamflashitem*)item;

@property(weak, nonatomic)UILabel *label;

@end