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
    
    [[analytics singleton] trackevent:ga_event_pic_file_delete action:ga_action_completed label:nil];
    
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
    NSString *string = NSLocalizedString(@"pic_detail_file_delete", nil);
    
    return string;
}

-(void)action:(vpicdetail*)detail
{
    [[analytics singleton] trackevent:ga_event_pic_file_delete action:ga_action_start label:nil];
    
    self.detail = detail;
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"pic_detail_file_delete_title", nil) message:NSLocalizedString(@"pic_detail_file_delete_descr", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"alert_cancel", nil) otherButtonTitles:NSLocalizedString(@"pic_detail_file_delete", nil), nil] show];
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    if(index)
    {
        [self performdelete];
    }
    else
    {
        [[analytics singleton] trackevent:ga_event_pic_file_delete action:ga_action_cancel label:nil];
    }
}

@end