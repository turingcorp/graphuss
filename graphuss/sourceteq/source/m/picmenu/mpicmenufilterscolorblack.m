#import "mpicmenufilterscolorblack.h"

@implementation mpicmenufilterscolorblack

#pragma mark -
#pragma mark filters protocol

-(NSString*)title
{
    NSString *str = NSLocalizedString(@"pic_detail_filters_menu_colors_black", nil);
    
    return str;
}

-(id<mgraphicsfilterprotocol>)filter
{
    mgraphicsfilterbwbasic *filter = [[mgraphicsfilterbwbasic alloc] init];
    
    return filter;
}

@end