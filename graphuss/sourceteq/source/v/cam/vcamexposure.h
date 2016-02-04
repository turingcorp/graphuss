#import "appdel.h"

@class ccam;
@class vcamexposureiso;

@interface vcamexposure:UIView

-(instancetype)init:(ccam*)controller;
-(void)updateexposure;

@property(weak, nonatomic)ccam *controller;
@property(weak, nonatomic)vcamexposureiso *iso;
@property(weak, nonatomic)UISlider *slider;
@property(weak, nonatomic)UILabel *labelmin;
@property(weak, nonatomic)UILabel *labelmax;
@property(weak, nonatomic)UILabel *labeliso;

@end