#import "appdel.h"

@class ccam;

@interface vcamflash:UIView

-(instancetype)init:(ccam*)controller;

@property(weak, nonatomic)ccam *controller;

@end