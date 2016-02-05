#import "crate.h"

@implementation crate

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

-(void)loadView
{
    self.view = [[vrate alloc] init:self];
}

@end