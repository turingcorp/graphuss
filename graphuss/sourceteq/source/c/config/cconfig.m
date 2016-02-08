#import "cconfig.h"

@implementation cconfig

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_config];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.viewconfig refresh];
}

-(void)loadView
{
    self.view = [[vconfig alloc] init:self];
    self.viewconfig = (vconfig*)self.view;
}

#pragma mark public

-(void)selected:(id<mconfigprotocol>)item
{
    [self.navigationController pushViewController:[item controller] animated:YES];
}

@end