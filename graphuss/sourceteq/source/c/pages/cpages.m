#import "cpages.h"

@implementation cpages
{
    NSTimer *timer;
}

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.model = [[mpages alloc] init];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"app_title", nil)];
    
    self.itemconfig = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"engine"] style:UIBarButtonItemStylePlain target:self action:@selector(actionleft)];
    self.itemcamera = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(actionright)];
    self.itemlistleft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(actionleft)];
    self.itemlistright = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(actionright)];
    
    [self loadpage:app_page_list animated:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self timerforbuttons];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark actions

-(void)actionleft
{
    [self loadpage:[self.modelitem pageleft] animated:YES];
    
    [self timerforbuttons];
}

-(void)actionright
{
    [self loadpage:[self.modelitem pageright] animated:YES];
    
    [self timerforbuttons];
}

#pragma mark functionality

-(void)blockbuttons
{
    [timer invalidate];
    [self.itemcamera setEnabled:NO];
    [self.itemconfig setEnabled:NO];
    [self.itemlistleft setEnabled:NO];
    [self.itemlistright setEnabled:NO];
}

-(void)unblockbuttons
{
    [timer invalidate];
    [self.itemcamera setEnabled:YES];
    [self.itemconfig setEnabled:YES];
    [self.itemlistleft setEnabled:YES];
    [self.itemlistright setEnabled:YES];
}

-(void)timerforbuttons
{
    [self blockbuttons];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(unblockbuttons) userInfo:nil repeats:NO];
}

-(void)loadpage:(app_page)page animated:(BOOL)animated
{
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    
    if(self.modelitem.page > page)
    {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    
    self.modelitem = [self.model item:page];
    __weak cpages *weakself = self;
    
    NSArray *controllers = @[[self.modelitem controller]];
    [self setViewControllers:controllers direction:direction animated:animated completion:
     ^(BOOL done)
     {
         [weakself clearitems];
         
         if([weakself.modelitem showitemcamera])
         {
             [weakself showitemcamera];
         }
         
         if([weakself.modelitem showitemlistleft])
         {
             [weakself showitemlistleft];
         }
         
         if([weakself.modelitem showitemlistright])
         {
             [weakself showitemlistright];
         }
         
         if([weakself.modelitem showitemconfig])
         {
             [weakself showitemconfig];
         }
     }];
}

-(void)clearitems
{
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = nil;
}

-(void)showitemcamera
{
    self.navigationItem.rightBarButtonItem = self.itemcamera;
}

-(void)showitemlistleft
{
    self.navigationItem.leftBarButtonItem = self.itemlistleft;
}

-(void)showitemlistright
{
    self.navigationItem.rightBarButtonItem = self.itemlistright;
}

-(void)showitemconfig
{
    self.navigationItem.leftBarButtonItem = self.itemconfig;
}

#pragma mark public

-(void)startshooting
{
    [self actionright];
}

@end