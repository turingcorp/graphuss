#import "appdel.h"

@class vpicdetail;

@interface vpicdetaileditscale:UIView<UITextFieldDelegate>

+(void)askscale:(vpicdetail*)detail;

@property(weak, nonatomic)vpicdetail *detail;
@property(weak, nonatomic)UITextField *fieldwidth;
@property(weak, nonatomic)UITextField *fieldheight;
@property(weak, nonatomic)UIButton *buttonaccept;
@property(weak, nonatomic)UIButton *buttoncancel;
@property(weak, nonatomic)UILabel *labelwidth;
@property(weak, nonatomic)UILabel *labelheight;
@property(weak, nonatomic)UILabel *labelratio;

@end