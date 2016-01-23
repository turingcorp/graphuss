#import "appdel.h"
#import "viewbase.h"

@class mpicitem;
@class vpicdetailmenu;

@interface vpicdetail:viewbase

-(void)loadpic:(mpicitem*)pic;

@property(weak, nonatomic)mpicitem *pic;
@property(weak, nonatomic)vpicdetailmenu *menu;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIView *overview;

@end