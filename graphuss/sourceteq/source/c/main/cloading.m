#import "cloading.h"

@implementation cloading
{
    FBSDKGraphRequest *request;
}

-(instancetype)init
{
    self = [super init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedloadingfinished:) name:notloadfinish object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView
{
    self.view = [[vloading alloc] init];
}

#pragma mark notifications

-(void)notifiedloadingfinished:(NSNotification*)notification
{
    if([msession singleton].userid)
    {
        [[cmain singleton] openinitial];
    }
    else
    {
        [clogin asklogin:NO];
    }
}

@end