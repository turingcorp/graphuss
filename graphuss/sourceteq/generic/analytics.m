#import "analytics.h"

@implementation analytics
{
    NSArray *screens;
    NSArray *events;
    NSArray *actions;
}

+(instancetype)singleton
{
    static analytics *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"analytics" withExtension:@"plist"]];
    screens = plist[@"screens"];
    events = plist[@"events"];
    actions = plist[@"actions"];
    
    return self;
}

#pragma mark public

-(void)start
{
    self.tracker = [[GAI sharedInstance] trackerWithTrackingId:analyticsid];
    [[GAI sharedInstance] setTrackUncaughtExceptions:YES];
    [[GAI sharedInstance] setDispatchInterval:5];
    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelNone];
}

-(void)trackscreen:(ga_screen)screen
{
    [self.tracker send:[[[GAIDictionaryBuilder createScreenView] set:screens[screen] forKey:kGAIScreenName] build]];
}

-(void)trackevent:(ga_event)event action:(ga_action)action label:(NSString*)label
{
    NSString *eventname = events[event];
    NSString *eventaction = actions[action];
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:eventname action:eventaction label:label value:@(1)] build]];
}

@end