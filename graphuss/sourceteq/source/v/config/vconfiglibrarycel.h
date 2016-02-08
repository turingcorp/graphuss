#import "appdel.h"

@interface vconfiglibrarycel:UICollectionViewCell

-(void)config:(id<mconfiglibraryprotocol>)item;

@property(weak, nonatomic)UILabel *label;

@end