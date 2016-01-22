#import "appdel.h"

@interface mpic:NSObject

+(instancetype)singleton;
-(void)firsttime;

@property(copy, nonatomic)NSString *imagesfolder;
@property(copy, nonatomic)NSString *thumbsfolder;

@end