#import "mpicmenufiltersbwblue.h"

@implementation mpicmenufiltersbwblue

#pragma mark -
#pragma mark filters protocol

-(NSString*)title
{
    NSString *str = NSLocalizedString(@"pic_detail_filters_menu_black_white_bluish", nil);
    
    return str;
}

-(id<mgraphicsfilterprotocol>)filter
{
    return nil;
}

@end