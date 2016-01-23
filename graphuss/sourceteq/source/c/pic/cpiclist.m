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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[(vpiclist*)self.view collection] reloadData];
}

#pragma mark public

-(void)detailpic:(NSInteger)index
{
    [[cmain singleton] pushViewController:[[cpicdetail alloc] init:[[mpic singleton] item:index]] animated:YES];
}

@end