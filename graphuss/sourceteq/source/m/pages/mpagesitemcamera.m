#import "mpagesitemcamera.h"

@implementation mpagesitemcamera

-(instancetype)init
{
    self = [super init];
    
    self.page = app_page_camera;
    
    return self;
}

#pragma mark -
#pragma mark item

-(app_page)pageleft
{
    return app_page_list;
}

-(BOOL)showitemlistleft
{
    return YES;
}

-(UIViewController*)controller
{
    return [[ccam alloc] init];
}


@end