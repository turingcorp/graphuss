#import "appdel.h"
#import "viewbase.h"

@class vratemenu;

@interface vrate:viewbase

-(void)rateselected;

@property(weak, nonatomic)vratemenu *menu;
@property(weak, nonatomic)UIButton *buttonsend;

@end