#import "appdel.h"

@class ccam;

@interface vcamexposure:UIView

-(instancetype)init:(ccam*)controller;

@property(weak, nonatomic)ccam *controller;

@end