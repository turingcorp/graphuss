#import "appdel.h"

@class ccam;
@class vcamexposureiso;

@interface vcamexposure:UIView

-(instancetype)init:(ccam*)controller;

@property(weak, nonatomic)ccam *controller;
@property(weak, nonatomic)vcamexposureiso *iso;

@end