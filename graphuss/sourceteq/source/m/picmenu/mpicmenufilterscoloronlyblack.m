#import "mpicmenufilterscoloronlyblack.h"

@implementation mpicmenufilterscoloronlyblack

#pragma mark -
#pragma mark filters protocol

-(NSString*)title
{
    NSString *str = NSLocalizedString(@"pic_detail_filters_menu_colors_onlyblack", nil);
    
    return str;
}

-(id<mgraphicsfilterprotocol>)filter
{
    mgraphicsfiltercoloronlyblack *filter = [[mgraphicsfiltercoloronlyblack alloc] init];
    
    return filter;
}

@end