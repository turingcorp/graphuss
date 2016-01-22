#import "appdel.h"

@interface mpicitem:NSObject

-(instancetype)init:(NSNumber*)picid created:(NSInteger)created syncstamp:(NSInteger)syncstamp;
-(UIImage*)thumb;

@property(nonatomic)NSInteger picid;
@property(nonatomic)NSInteger created;
@property(nonatomic)NSInteger syncstamp;

@end