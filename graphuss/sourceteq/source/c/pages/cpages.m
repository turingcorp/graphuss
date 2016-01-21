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
    
    UIBarButtonItem *itemconfig = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"engine"] style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *itemlist = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    UIBarButtonItem *itemcamera = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    
    self.navigationItem.rightBarButtonItem = itemconfig;
    self.navigationItem.leftBarButtonItem = itemcamera;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end