#import "cpicdetail.h"

@implementation cpicdetail

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_pic_detail];
}

-(void)loadView
{
    self.view = [[UIView alloc] init];
}

@end