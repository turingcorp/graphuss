#import <UIKit/UIKit.h>

@interface viewbase:UIView

-(instancetype)init:(UIViewController*)controller;

@property(weak, nonatomic)UIViewController *controller;

@end