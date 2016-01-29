#import "mpages.h"
#import "mpagesitemcamera.h"
#import "mpagesitemlist.h"
#import "mpagesitemconfig.h"

@implementation mpages
{
    NSMutableDictionary *dict;
}

+(mpagesitem*)item:(app_page)page
{
    mpagesitem *item;
    
    switch(page)
    {
        case app_page_camera:
            
            item = [[mpagesitemcamera alloc] init];
            
            break;
            
        case app_page_list:
            
            item = [[mpagesitemlist alloc] init];
            
            break;
            
        case app_page_config:
            
            item = [[mpagesitemconfig alloc] init];
            
            break;
    }
    
    return item;
}

-(instancetype)init
{
    self = [super init];
    
    dict = [NSMutableDictionary dictionary];
    [self add:app_page_camera];
    [self add:app_page_list];
    [self add:app_page_config];
    
    return self;
}

#pragma mark functionality

-(void)add:(app_page)page
{
    dict[@(page)] = [mpages item:page];
}

#pragma mark public

-(mpagesitem*)item:(app_page)page
{
    mpagesitem *item = dict[@(page)];
    
    return item;
}

@end