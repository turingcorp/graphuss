#import "appdel.h"
#import "mgeneral.h"

@interface analytics:NSObject

+(instancetype)singleton;
-(void)start;
-(void)trackscreen:(ga_screen)screen;
-(void)trackevent:(ga_event)event action:(ga_action)action label:(NSString*)label;

@property(weak, nonatomic)id<GAITracker> tracker;

@end