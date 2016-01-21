#import "ccam.h"

@implementation ccam

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)loadView
{
    self.view = [[vcam alloc] init:self];
}

@end