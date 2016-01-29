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
    self.viewlist = (vpiclist*)self.view;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.viewlist.visible = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.viewlist.visible = NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.viewlist update];
}

#pragma mark public

-(void)detailpic:(NSInteger)index
{
    [[cmain singleton] pushViewController:[[cpicdetail alloc] init:[[mpic singleton] item:index]] animated:YES];
}

@end