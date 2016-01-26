#import "mpicmenufiledelete.h"

@implementation mpicmenufiledelete

#pragma mark -
#pragma mark file protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_file_delete", nil);
}

-(void)action:(vpicdetail*)detail
{
    self.detail = detail;
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"pic_detail_menu_file_delete_title", nil) message:NSLocalizedString(@"pic_detail_menu_file_delete_descr", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"alert_cancel", nil) otherButtonTitles:NSLocalizedString(@"pic_detail_menu_file_delete", nil), nil] show];
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    if(index)
    {
        
    }
}

@end