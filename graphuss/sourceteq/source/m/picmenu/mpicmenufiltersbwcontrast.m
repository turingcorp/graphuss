#import "mpicmenufiltersbwcontrast.h"

@implementation mpicmenufiltersbwcontrast

#pragma mark -
#pragma mark filters protocol

-(NSString*)title
{
    NSString *str = NSLocalizedString(@"pic_detail_filters_menu_black_white_contrast", nil);
    
    return str;
}

@end