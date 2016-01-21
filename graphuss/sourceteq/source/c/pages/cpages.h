#import "appdel.h"

@interface cpages:UIPageViewController

+(instancetype)singleton;

@property(strong, nonatomic)UIBarButtonItem *itemcamera;
@property(strong, nonatomic)UIBarButtonItem *itemlist;
@property(strong, nonatomic)UIBarButtonItem *itemconfig;

@end