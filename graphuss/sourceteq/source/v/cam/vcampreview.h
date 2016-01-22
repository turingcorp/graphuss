#import "appdel.h"

@interface vcampreview:UIView

-(void)showimage:(UIImage*)image;
-(void)clearimage;

@property(weak, nonatomic)UIImageView *imageview;

@end