#import "appdel.h"

@class mpicitem;

@interface mpic:NSObject

+(UIImage*)scaleimage:(UIImage*)image scale:(CGFloat)scale;
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


@property(copy, nonatomic)NSString *imagesfolder;
@property(copy, nonatomic)NSString *thumbsfolder;

@end