#import "mpicmenufiledelete.h"

@implementation mpicmenufiledelete

#pragma mark functionality

-(void)performdelete
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [[mpic singleton] deletepic:self.detail.pic];
                       [self deletecomplete];
                   });
}

-(void)deletecomplete
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.detail.controller.navigationController popViewControllerAnimated:YES];
                   });
}

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
        [self performdelete];
    }
}

@end