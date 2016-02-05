#import "cconfiglibrary.h"

@implementation cconfiglibrary

-(instancetype)init:(mconfiglibrary*)model
{
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_library_title", nil)];
}

-(void)loadView
{
    self.view = [[vconfiglibrary alloc] init:self];
}

@end