#import "appdel.h"

@class mpicitem;
@class vpicdetail;

@interface cpicdetail:UIViewController

-(instancetype)init:(mpicitem*)pic;
-(void)edit_rotate:(UIImageOrientation)orientation;

@property(strong, nonatomic)mpicitem *pic;
@property(weak, nonatomic)vpicdetail *viewdetail;
@property(strong, nonatomic)UIImage *image;

@end