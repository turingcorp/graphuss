#import "mpicmenufiltersbwbasic.h"

@implementation mpicmenufiltersbwbasic

#pragma mark -
#pragma mark filters protocol

-(NSString*)title
{
    NSString *str = NSLocalizedString(@"pic_detail_filters_menu_black_white_basic", nil);
    
    return str;
}

@end