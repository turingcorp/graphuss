#import "cmain.h"

@implementation cmain

+(instancetype)singleton
{
    static cmain *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self setViewControllers:@[[[cloading alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontname size:16]} forState:UIControlStateNormal];
    
    [vmenu addto:self.view];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)safeopensection:(id<msectionprotocol>)section animated:(BOOL)animated
{
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    UIViewController *controller = [section controller];
    
    if([section section] < [self.section section])
    {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    
    self.section = section;
    [self setViewControllers:@[controller] direction:direction animated:animated completion:nil];
}

#pragma mark public

-(void)openinitial
{
    [[cmain singleton] opensection:[msection browse] animated:NO];
    
    if(![mmyprofile singleton].profile.age)
    {
        [cprofileage askage];
    }
}

-(void)opensection:(id<msectionprotocol>)section animated:(BOOL)animated
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [self safeopensection:section animated:animated];
                       [[NSNotificationCenter defaultCenter] postNotificationName:notmenuchanged object:nil];
                   });
}

@end