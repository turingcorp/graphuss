#import "cconfigcontact.h"

@implementation cconfigcontact

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_contact_title", nil)];
    [[analytics singleton] trackscreen:ga_screen_config_contact];
}

-(void)loadView
{
    self.view = [[vconfigcontact alloc] init:self];
}

@end