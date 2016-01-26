#import "mpicmenufile.h"

@implementation mpicmenufile

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_file", nil);
}

-(UIView*)overview
{
    return [[vpicdetailfile alloc] init];
}

@end