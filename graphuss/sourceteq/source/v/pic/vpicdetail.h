#import "appdel.h"
#import "viewbase.h"

@class mpicitem;

@interface vpicdetail:viewbase

-(void)loadpic:(mpicitem*)pic;

@property(weak, nonatomic)mpicitem *pic;
@property(weak, nonatomic)UIImageView *image;

@end