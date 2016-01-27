#import "mpicmenufilterslight.h"

@implementation mpicmenufilterslight

#pragma mark -
#pragma mark filters protocol

-(NSString*)image
{
    return @"light";
}

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_filters_menu_light", nil);
}

-(void)action:(vpicdetailfilters*)filters
{
    
}

@end