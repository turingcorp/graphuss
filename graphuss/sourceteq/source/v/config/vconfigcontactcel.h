#import "appdel.h"
#import "mconfigcontactprotocol.h"

@interface vconfigcontactcel:UICollectionViewCell

-(void)config:(id<mconfigcontactprotocol>)model;

@property(weak, nonatomic)UILabel *label;

@end