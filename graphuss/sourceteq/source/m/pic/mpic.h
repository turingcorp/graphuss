#import "appdel.h"

@interface mpic:NSObject

+(instancetype)singleton;
-(void)firsttime;
-(NSURL*)urlforimage:(NSInteger)picid;
-(NSURL*)urlforthumb:(NSInteger)picid;
-(void)savepic:(UIImage*)pic;
-(NSInteger)count;


@property(copy, nonatomic)NSString *imagesfolder;
@property(copy, nonatomic)NSString *thumbsfolder;

@end