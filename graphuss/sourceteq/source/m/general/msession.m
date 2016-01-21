#import "msession.h"

@implementation msession

+(instancetype)singleton
{
    static msession *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedprofilechange:) name:FBSDKProfileDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedtokenchanged:) name:FBSDKAccessTokenDidChangeNotification object:nil];
    
    if([FBSDKAccessToken currentAccessToken])
    {
        [self loaduser];
    }
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedprofilechange:(NSNotification*)notification
{
    [self loaduser];
}

-(void)notifiedtokenchanged:(NSNotification*)notification
{
    [self loaduser];
}

#pragma mark functionality

-(void)loaduser
{
    self.userid = [FBSDKAccessToken currentAccessToken].userID;
    
    if(self.userid)
    {
        [[mmyprofile singleton] loaduser];
        [self updateprofile];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notmenuchanged object:nil];
}

-(void)retrievefromfacebook
{
    [[analytics singleton] trackevent:ga_event_facebook_profile action:ga_action_start label:nil];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields":@"gender"}] startWithCompletionHandler:
                        ^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
                        {
                            if(error)
                            {
                                NSString *errordescription = error.localizedDescription;
                                [[analytics singleton] trackevent:ga_event_facebook_profile action:ga_action_error label:errordescription];
                                
                                NSLog(@"%@", errordescription);
                            }
                            else
                            {
                                profile_gender prof_gender = profile_gender_female;
                                NSString *gender = [result[@"gender"] lowercaseString];
                                [[analytics singleton] trackevent:ga_event_facebook_profile action:ga_action_done label:gender];
                                
                                if([gender isEqualToString:@"male"])
                                {
                                    prof_gender = profile_gender_male;
                                }
                                
                                [[mmyprofile singleton] updategender:prof_gender];
                            }
                        }];
                   });
}

-(void)updateprofile
{
    NSString *updatename = [mmyprofilenames namefortype:[mmyprofile singleton].nametype];
    
    if(updatename)
    {
        [[mmyprofile singleton] updatename:updatename];
    }
    else
    {
        mmyprofilename *newname = [mmyprofilenames firstvalid];
        
        if(!newname)
        {
            newname = [[mmyprofilename alloc] init:profile_name_firstname value:NSLocalizedString(@"profile_default_user", nil)];
        }
        
        [[mmyprofile singleton] changenameto:newname];
    }
    
    [self retrievefromfacebook];
}

@end