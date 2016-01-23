#import "appdel.h"

@interface mpicitem:NSObject

-(instancetype)init:(NSNumber*)picid created:(NSNumber*)created syncstamp:(NSNumber*)syncstamp;
-(CGFloat)heightforwidth:(CGFloat)width;

@property(strong, nonatomic)UIImage *thumb;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)NSInteger picid;
@property(nonatomic)NSInteger created;
@property(nonatomic)NSInteger syncstamp;

@end