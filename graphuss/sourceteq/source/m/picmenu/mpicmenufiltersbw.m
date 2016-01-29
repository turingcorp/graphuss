#import "mpicmenufiltersbw.h"

@implementation mpicmenufiltersbw

#pragma mark -
#pragma mark filters protocol

-(NSString*)image
{
    NSString *string = @"light";
    
    return string;
}

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_filters_menu_black_white", nil);
    
    return string;
}

-(void)action:(vpicdetailfilters*)filters
{
    [filters.overview removeFromSuperview];
    
}

@end