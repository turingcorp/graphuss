#import "crate.h"

@implementation crate

-(instancetype)init
{
    self = [super init];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];

    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [[analytics singleton] trackscreen:ga_screen_rate];
}

-(void)loadView
{
    self.view = [[vrate alloc] init:self];
}

@end