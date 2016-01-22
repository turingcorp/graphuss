#import "appdel.h"

@class mpicitem;

@interface mpic:NSObject

+(instancetype)singleton;
-(void)firsttime;
-(NSString*)fileforimage:(NSInteger)picid;
-(NSString*)fileforthumb:(NSInteger)picid;
-(void)savepic:(UIImage*)pic;
-(NSInteger)count;
-(mpicitem*)item:(NSInteger)index;


@property(copy, nonatomic)NSString *imagesfolder;
@property(copy, nonatomic)NSString *thumbsfolder;

@end