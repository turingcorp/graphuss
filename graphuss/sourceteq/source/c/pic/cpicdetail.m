#import "cpicdetail.h"

@implementation cpicdetail

-(instancetype)init:(mpicitem*)pic
{
    self = [super init];
    
    self.pic = pic;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"pic_detail_title", nil)];
    [[analytics singleton] trackscreen:ga_screen_pic_detail];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [(vpicdetail*)self.view loadpic:self.pic];
    [self.navigationController.interactivePopGestureRecognizer setEnabled:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.interactivePopGestureRecognizer setEnabled:YES];
}

-(void)loadView
{
    self.view = [[vpicdetail alloc] init:self];
}

#pragma mark functionality

-(void)writingbusy:(BOOL)busy
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.navigationController.navigationItem.backBarButtonItem setEnabled:!busy];
                   });
}

#pragma mark public

-(void)rotate:(UIImageOrientation)orientation
{
    
}

@end