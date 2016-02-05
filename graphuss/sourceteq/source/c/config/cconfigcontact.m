#import "cconfigcontact.h"

@implementation cconfigcontact

-(instancetype)init:(mconfigcontact*)model
{
    self = [super init];
    
    self.model = model;
    
    return self;
}

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