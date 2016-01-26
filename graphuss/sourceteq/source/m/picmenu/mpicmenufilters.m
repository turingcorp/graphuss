#import "mpicmenufilters.h"

@implementation mpicmenufilters

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_filters", nil);
}

-(void)selected:(vpicdetail*)detail
{
}

@end