#import "cpiclist.h"

@implementation cpiclist

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_pic_list];
}

-(void)loadView
{
    self.view = [[vpiclist alloc] init:self];
}

#pragma mark public

-(void)detailpic:(NSInteger)index
{
    
}

@end