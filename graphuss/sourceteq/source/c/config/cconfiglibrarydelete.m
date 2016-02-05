#import "cconfiglibrarydelete.h"

@implementation cconfiglibrarydelete
{
    BOOL firstime;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:NSLocalizedString(@"config_library_disk_title", nil)];
    [[analytics singleton] trackscreen:ga_screen_config_library_delete];
    
    firstime = NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(!firstime)
    {
        firstime = YES;
    }
}

-(void)loadView
{
    self.view = [[vconfiglibrarydelete alloc] init];
}

@end