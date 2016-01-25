#import "cpicdetail.h"

@implementation cpicdetail

-(instancetype)init:(mpicitem*)pic
{
    self = [super init];
    
    self.pic = pic;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedwritingbusy:) name:notwritingbusy object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedwritingfree:) name:notwritingfree object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

#pragma mark notified

-(void)notifiedwritingbusy:(NSNotification*)notification
{
    [self writingbusy:YES];
}

-(void)notifiedwritingfree:(NSNotification*)notification
{
    [self writingbusy:NO];
}

#pragma mark functionality

-(void)writingbusy:(BOOL)busy
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.navigationItem setHidesBackButton:busy animated:YES];
                   });
}

#pragma mark public

-(void)edit_rotate:(UIImageOrientation)orientation
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
}

@end