#import "cconfigabout.h"

@implementation cconfigabout

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_about_title", nil)];
    [[analytics singleton] trackscreen:ga_screen_config_library];
}

-(void)loadView
{
    self.view = [[vconfiglibrary alloc] init:self];
}

@end