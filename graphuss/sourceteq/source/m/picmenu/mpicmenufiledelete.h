#import "appdel.h"
#import "mpicmenufileprotocol.h"

@class vpicdetail;

@interface mpicmenufiledelete:NSObject<mpicmenufileprotocol, UIAlertViewDelegate>

@property(weak, nonatomic)vpicdetail *detail;

@end