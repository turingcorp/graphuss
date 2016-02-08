#import "mpagesitemconfig.h"

@implementation mpagesitemconfig

-(instancetype)init
{
    self = [super init];
    
    self.page = app_page_config;
    
    return self;
}

#pragma mark -
#pragma mark item

-(app_page)pageright
{
    return app_page_list;
}

-(BOOL)showitemlistright
{
    return YES;
}

-(UIViewController*)controller
{
    cconfig *controller = [[cconfig alloc] init];
    
    return controller;
}

@end