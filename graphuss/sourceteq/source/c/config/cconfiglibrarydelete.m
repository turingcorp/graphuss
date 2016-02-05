#import "cconfiglibrarydelete.h"

@implementation cconfiglibrarydelete
{
    BOOL firstime;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    firstime = NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(!firstime)
    {
        firstime = YES;
    }
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)loadView
{
    self.view = [[vconfiglibrarydelete alloc] init];
}

@end