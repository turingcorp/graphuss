#import "mpagesitem.h"

@implementation mpagesitem

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(app_page)pageleft
{
    return self.page;
}

-(app_page)pageright
{
    return self.page;
}

-(BOOL)showitemcamera
{
    return NO;
}

-(BOOL)showitemlistleft
{
    return NO;
}

-(BOOL)showitemlistright
{
    return NO;
}

-(BOOL)showitemconfig
{
    return NO;
}

-(UIViewController*)controller
{
    return [[UIViewController alloc] init];
}

@end