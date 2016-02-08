#import "appdel.h"

@interface vratemenucel:UICollectionViewCell

-(void)choose:(BOOL)choosen;

@property(weak, nonatomic)UIImageView *image;
@property(nonatomic)BOOL choosen;

@end