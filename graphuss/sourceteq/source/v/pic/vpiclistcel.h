#import "appdel.h"

@class mpicitem;

@interface vpiclistcel:UICollectionViewCell

-(void)config:(mpicitem*)pic;

@property(weak, nonatomic)mpicitem *pic;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIImageView *firsttime;

@end