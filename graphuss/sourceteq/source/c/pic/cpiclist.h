#import "appdel.h"

@class vpiclist;

@interface cpiclist:UIViewController

-(void)detailpic:(NSInteger)index;

@property(weak, nonatomic)vpiclist *viewlist;

@end