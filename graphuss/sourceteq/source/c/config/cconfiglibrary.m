#import "cconfiglibrary.h"

@implementation cconfiglibrary

-(instancetype)init:(mconfiglibrary*)model
{
    self = [super init];
    
    self.model = model;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_library_title", nil)];
    [[analytics singleton] trackscreen:ga_screen_config_library];
}

-(void)loadView
{
    self.view = [[vconfiglibrary alloc] init:self];
}

@end