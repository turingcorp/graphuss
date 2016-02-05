#import "cconfigabout.h"

@implementation cconfigabout

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_about_title", nil)];
    [[analytics singleton] trackscreen:ga_screen_config_about];
}

-(void)loadView
{
    self.view = [[vconfigabout alloc] init:self];
}

@end