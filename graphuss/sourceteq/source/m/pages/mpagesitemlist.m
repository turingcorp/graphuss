#import "mpagesitemlist.h"

@implementation mpagesitemlist

-(instancetype)init
{
    self = [super init];
    
    self.page = app_page_list;
    
    return self;
}

#pragma mark -
#pragma mark item

-(app_page)pageleft
{
    return app_page_config;
}

-(app_page)pageright
{
    return app_page_camera;
}

-(BOOL)showitemcamera
{
    return YES;
}

-(BOOL)showitemconfig
{
    return YES;
}

-(UIViewController*)controller
{
    cpiclist *controller = [[cpiclist alloc] init];
    
    return controller;
}

@end