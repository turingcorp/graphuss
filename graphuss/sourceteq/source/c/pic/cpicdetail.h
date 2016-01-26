#import "appdel.h"

@class mpicitem;
@class vpicdetail;

@interface cpicdetail:UIViewController

-(instancetype)init:(mpicitem*)pic;
-(void)edit_rotateleft;
-(void)edit_rotateright;
-(void)edit_compress:(CGFloat)quality;

@property(strong, nonatomic)mpicitem *pic;
@property(weak, nonatomic)vpicdetail *viewdetail;
@property(strong, nonatomic)UIImage *image;

@end