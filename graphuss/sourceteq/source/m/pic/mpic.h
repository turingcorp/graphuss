#import "appdel.h"

@interface mpic:NSObject

+(instancetype)singleton;
-(void)firsttime;
-(NSURL*)urlforimage:(NSInteger)picid;
-(NSURL*)urlforthum:(NSInteger)picid;

@property(copy, nonatomic)NSString *imagesfolder;
@property(copy, nonatomic)NSString *thumbsfolder;

@end