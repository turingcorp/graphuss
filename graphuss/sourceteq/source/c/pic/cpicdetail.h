#import "appdel.h"

@class mpicitem;

@interface cpicdetail:UIViewController

-(instancetype)init:(mpicitem*)pic;
-(void)edit_rotate:(UIImageOrientation)orientation;

@property(strong, nonatomic)mpicitem *pic;
@property(strong, nonatomic)UIImage *image;

@end