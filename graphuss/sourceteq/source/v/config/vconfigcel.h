#import "appdel.h"

@interface vconfigcel:UICollectionViewCell

-(void)config:(id<mconfigprotocol>)item;

@property(weak, nonatomic)UILabel *label;

@end