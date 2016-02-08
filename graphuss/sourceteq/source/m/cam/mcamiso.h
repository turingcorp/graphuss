#import "appdel.h"

@class mcamisoitem;

@interface mcamiso:NSObject

-(instancetype)init:(AVCaptureDevice*)device;
-(NSUInteger)count;
-(mcamisoitem*)item:(NSInteger)index;
-(CGFloat)currentiso;

@property(nonatomic)CGFloat maxiso;
@property(nonatomic)CGFloat miniso;
@property(nonatomic)NSInteger selected;

@end