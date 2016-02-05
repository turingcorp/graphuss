#import "appdel.h"

@class mconfigcontact;

@interface cconfigcontact:UIViewController

-(instancetype)init:(mconfigcontact*)model;

@property(weak, nonatomic)mconfigcontact *model

@end