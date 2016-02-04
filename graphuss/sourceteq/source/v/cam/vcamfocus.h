#import "appdel.h"

@class ccam;

@interface vcamfocus:UIView

-(instancetype)init:(ccam*)controller;

@property(weak, nonatomic)ccam *controller;
@property(weak, nonatomic)UISlider *slider;
@property(weak, nonatomic)UILabel *labelmin;
@property(weak, nonatomic)UILabel *labelmax;

@end