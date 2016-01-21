#import "appdel.h"

@interface cmain:UIPageViewController

+(instancetype)singleton;
-(void)openinitial;
-(void)opensection:(id<msectionprotocol>)section animated:(BOOL)animated;

@property(strong, nonatomic)id<msectionprotocol> section;

@end