#import "appdel.h"

@class mcamisoitem;

@interface mcamiso:NSObject

-(instancetype)init:(AVCaptureDevice*)device;
-(NSUInteger)count;
-(mcamisoitem*)item:(NSInteger)index;

@property(nonatomic)CGFloat maxiso;
@property(nonatomic)CGFloat miniso;

@end