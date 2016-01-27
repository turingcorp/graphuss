#import "mpicmenufilterscolor.h"

@implementation mpicmenufilterscolor

#pragma mark -
#pragma mark filters protocol

-(NSString*)image
{
    return @"scale";
}

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_filters_menu_colors", nil);
}

-(void)action:(vpicdetailfilters*)filters
{
    
}

@end