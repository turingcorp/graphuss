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
    [[cmain singleton] pushViewController:[[cpicdetail alloc] init] animated:YES];
}

@end