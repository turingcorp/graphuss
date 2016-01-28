#import "appdel.h"

@interface vpiclistcel:UICollectionViewCell

-(void)config:(mpicitem*)pic;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIImageView *firsttime;

@end