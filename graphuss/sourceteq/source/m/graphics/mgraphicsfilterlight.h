#import "appdel.h"
#import "mgraphicsfilterprotocol.h"

@interface mgraphicsfilterlight:NSObject<mgraphicsfilterprotocol>

-(instancetype)init:(CGFloat)light;

@property(nonatomic)CGFloat light;

@end