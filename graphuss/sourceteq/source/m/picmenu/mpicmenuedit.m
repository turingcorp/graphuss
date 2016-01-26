#import "mpicmenuedit.h"

@implementation mpicmenuedit

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_edit", nil);
}

-(UIView*)overview
{
    return [[vpicdetailedit alloc] init];
}

@end