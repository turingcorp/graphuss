#import "appdel.h"

@class mconfiglibrary;

@interface cconfiglibrary:UIViewController

-(instancetype)init:(mconfiglibrary*)model;

@property(weak, nonatomic)mconfiglibrary *model;

@end