#import "appdel.h"

@implementation appdel
{
    UIWindow *window;
}

-(BOOL)application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options
{
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    [window setBackgroundColor:[UIColor whiteColor]];
    [window setRootViewController:[cmain singleton]];

    [[FBSDKApplicationDelegate sharedInstance] application:app didFinishLaunchingWithOptions:options];
    [updater launch];
    
    return YES;
}

-(BOOL)application:(UIApplication*)app openURL:(NSURL*)url sourceApplication:(NSString*)source annotation:(id)ann
{
    return [[FBSDKApplicationDelegate sharedInstance] application:app openURL:url sourceApplication:source annotation:ann];
}

-(void)applicationDidBecomeActive:(UIApplication*)app
{
    [FBSDKAppEvents activateApp];
}

@end