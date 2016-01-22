#import "cpages.h"

@implementation cpages

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
}

-(void)actionright
{
    [self loadpage:[self.modelitem pageright] animated:YES];
}

#pragma mark functionality

-(void)loadpage:(app_page)page animated:(BOOL)animated
{
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    
    if(self.modelitem.page > page)
    {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    
    self.modelitem = [self.model item:page];
    __weak cpages *weakself = self;

    [self setViewControllers:@[[self.modelitem controller]] direction:direction animated:animated completion:
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

@end