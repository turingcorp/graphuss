#import "cmain.h"

@implementation cmain

+(instancetype)singleton
{
    static cmain *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(instancetype)init
{
    self = [super initWithRootViewController:[[cpages alloc] init]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedwritingbusy:) name:notwritingbusy object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedwritingfree:) name:notwritingfree object:nil];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setTintColor:colormain];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontboldname size:16], NSForegroundColorAttributeName:colormain}];
    [self.navigationBar setTranslucent:NO];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontboldname size:15], NSForegroundColorAttributeName:colormain} forState:UIControlStateNormal];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
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
                       [self.navigationBar setUserInteractionEnabled:!busy];
                   });
}

@end