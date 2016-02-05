#import "cconfigcontact.h"

@implementation cconfigcontact

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_contact_title", nil)];
    [[analytics singleton] trackscreen:ga_screen_config_about];
}

-(void)loadView
{
    self.view = [[vconfigabout alloc] init:self];
}

@end