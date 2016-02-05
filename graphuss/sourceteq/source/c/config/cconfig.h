#import "appdel.h"

@class vconfig;

@interface cconfig:UIViewController

-(void)selected:(id<mconfigprotocol>)item;

@property(weak, nonatomic)vconfig *viewconfig;

@end