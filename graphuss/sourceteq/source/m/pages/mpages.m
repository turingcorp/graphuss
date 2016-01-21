#import "mpages.h"

@implementation mpages
{
    NSMutableDictionary *dict;
}

+(mpagesitem*)

-(instancetype)init
{
    self = [super init];
    
    dict = [NSMutableDictionary dictionary];
    
    return self;
}

#pragma mark functionality

-(void)add:(app_page)page
{
    dict[[tools typetokey:page]];
}

#pragma mark public



@end