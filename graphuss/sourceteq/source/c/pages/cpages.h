#import "appdel.h"

@class mpages;
@class mpagesitem;

@interface cpages:UIPageViewController

-(void)startshooting;

@property(strong, nonatomic)mpages *model;
@property(weak, nonatomic)mpagesitem *modelitem;
@property(strong, nonatomic)UIBarButtonItem *itemcamera;
@property(strong, nonatomic)UIBarButtonItem *itemlistleft;
@property(strong, nonatomic)UIBarButtonItem *itemlistright;
@property(strong, nonatomic)UIBarButtonItem *itemconfig;

@end