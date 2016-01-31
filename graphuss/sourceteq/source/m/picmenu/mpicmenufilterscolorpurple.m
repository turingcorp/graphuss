#import "mpicmenufilterscolorpurple.h"

@implementation mpicmenufilterscolorpurple

#pragma mark -
#pragma mark filters protocol

-(NSString*)title
{
    NSString *str = NSLocalizedString(@"pic_detail_filters_menu_colors_purple", nil);
    
    return str;
}

-(id<mgraphicsfilterprotocol>)filter
{
    mgraphicsfilterbwbasic *filter = [[mgraphicsfilterbwbasic alloc] init];
    
    return filter;
}

@end