#import "mpicmenufilterscolor.h"

@implementation mpicmenufilterscolor

#pragma mark -
#pragma mark filters protocol

-(NSString*)image
{
    NSString *string = @"scale";
    
    return string;
}

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_filters_menu_colors", nil);
    
    return string;
}

-(void)action:(vpicdetailfilters*)filters
{
    
}

@end