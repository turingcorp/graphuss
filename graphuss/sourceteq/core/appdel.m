#import "appdel.h"

@implementation appdel
{
    UIWindow *window;
}

-(BOOL)application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options
{
    [updater launch];
    
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    [window setBackgroundColor:[UIColor whiteColor]];
    [window setRootViewController:[cmain singleton]];
    
    return YES;
}

-(void)applicationDidBecomeActive:(UIApplication*)application
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *ttl = [defaults valueForKey:@"ttl"];
    
    if(ttl)
    {
        NSUInteger ttlint = ttl.unsignedIntegerValue;
        
        if(ttlint > 6)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                           ^
                           {
                               [[cmain singleton] presentViewController:[[crate alloc] init] animated:YES completion:
                                ^
                                {
                                    [defaults removeObjectForKey:@"ttl"];
                                }];
                           });
        }
        else
        {
            [defaults setValue:@(ttlint + 1) forKey:@"ttl"];
        }
    }
}

@end