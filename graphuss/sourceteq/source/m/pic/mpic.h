#import "appdel.h"

@class mpicitem;

@interface mpic:NSObject

+(instancetype)singleton;
-(void)firsttime;
-(NSString*)fileforimage:(NSString*)picname;
-(NSString*)fileforthumb:(NSString*)picname;
-(BOOL)savepic:(UIImage*)pic;
-(void)deletepic:(mpicitem*)pic;
-(void)duplicatepic:(mpicitem*)pic;
-(NSInteger)count;
-(mpicitem*)item:(NSInteger)index;
-(void)update:(NSString*)name image:(UIImage*)image;


@property(strong, nonatomic)NSMutableArray *array;
@property(copy, nonatomic)NSString *imagesfolder;
@property(copy, nonatomic)NSString *thumbsfolder;

@end