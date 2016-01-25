#import "appdel.h"

@class mpicitem;

@interface cpicdetail:UIViewController

-(instancetype)init:(mpicitem*)pic;
-(void)rotate:(UIImageOrientation)orientation;

@property(strong, nonatomic)mpicitem *pic;

@end