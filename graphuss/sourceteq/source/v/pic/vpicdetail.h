#import "appdel.h"
#import "viewbase.h"

@class mpicitem;
@class vpicdetailmenu;
@class cpicdetail;

@interface vpicdetail:viewbase

-(void)loadpic:(mpicitem*)pic;

@property(weak, nonatomic)mpicitem *pic;
@property(weak, nonatomic)vpicdetailmenu *menu;
@property(weak, nonatomic)cpicdetail *controllerdetail;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIView *overview;

@end