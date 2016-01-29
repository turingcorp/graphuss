#import "appdel.h"
#import "mpicmenueditprotocol.h"

@interface vpicdetaileditcel:UICollectionViewCell

-(void)config:(id<mpicmenueditprotocol>)model;

@property(weak, nonatomic)UIImageView *icon;

@end