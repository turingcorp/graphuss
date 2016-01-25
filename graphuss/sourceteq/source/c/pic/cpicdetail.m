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
    self.viewdetail = (vpicdetail*)self.view;
}

#pragma mark functionality

-(void)loadimage
{
    __weak cpicdetail *weakself = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       weakself.image = [UIImage imageWithContentsOfFile:[[mpic singleton] fileforimage:weakself.pic.name]];
                       weakself.pic.imagehd = weakself.image;
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [self.viewdetail loadpic:weakself.pic];
                                      });
                   });
}

#pragma mark public

-(void)edit_rotateleft
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
}

-(void)edit_rotateright
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
}

@end