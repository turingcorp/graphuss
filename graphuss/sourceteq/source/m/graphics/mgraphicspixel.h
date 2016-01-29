#import "appdel.h"

@interface mgraphicspixel:NSObject

-(instancetype)init:(uint)color;
-(uint)addlight:(CGFloat)light;

@property(nonatomic)uint red255;
@property(nonatomic)uint green255;
@property(nonatomic)uint blue255;

@end