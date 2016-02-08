#import "mpicmenufilterscoloronlyred.h"

@implementation mpicmenufilterscoloronlyred

#pragma mark -
#pragma mark filters protocol

-(NSString*)title
{
    NSString *str = NSLocalizedString(@"pic_detail_filters_menu_colors_onlyred", nil);
    
    return str;
}

-(id<mgraphicsfilterprotocol>)filter
{
    mgraphicsfiltercoloronlyred *filter = [[mgraphicsfiltercoloronlyred alloc] init];
    
    return filter;
}

@end