#import "appdel.h"

@class mpicitem;

@interface cpicdetail:UIViewController

-(instancetype)init:(mpicitem*)pic;

@property(strong, nonatomic)mpicitem *pic;

@end