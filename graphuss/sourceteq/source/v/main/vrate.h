#import "appdel.h"
#import "viewbase.h"

@class vratemenu;

@interface vrate:viewbase

-(void)rateselected;

@property(weak, nonatomic)vratemenu *menu;
@property(weak, nonatomic)UIButton *buttonsend;
@property(weak, nonatomic)UIButton *buttondone;
@property(weak, nonatomic)UIButton *buttonreview;
@property(weak, nonatomic)UIButton *buttonaccept;
@property(weak, nonatomic)UILabel *label;

@end