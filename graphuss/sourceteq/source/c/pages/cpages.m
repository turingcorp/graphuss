#import "cpages.h"

@implementation cpages

+(instancetype)singleton
{
    static cpages *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self setViewControllers:@[[[cpiclist alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"app_title", nil)];
    self.itemconfig = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"engine"] style:UIBarButtonItemStylePlain target:self action:@selector(actionconfig)];
    self.itemcamera = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(actioncamera)];
    self.itemlist = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(actionlist)];
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

-(void)actionconfig
{
    [self setViewControllers:@[[[cpiclist alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

-(void)actioncamera
{
    [self setViewControllers:@[[[cpiclist alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

-(void)actionlist
{
    [self setViewControllers:@[[[cpiclist alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

#pragma mark functionality

-(void)menucamera
{
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = self.itemlist;
}

-(void)menulist
{
    self.navigationItem.rightBarButtonItem = self.itemcamera;
    self.navigationItem.leftBarButtonItem = self.itemconfig;
}

-(void)menuconfig
{
    self.navigationItem.rightBarButtonItem = self.itemlist;
    self.navigationItem.leftBarButtonItem = nil;
}

@end