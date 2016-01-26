#import "mpicmenufileduplicate.h"

@implementation mpicmenufileduplicate

#pragma mark -
#pragma mark file protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_file_duplicate", nil);
}

-(void)action:(vpicdetail*)detail
{
    [[analytics singleton] trackevent:ga_event_pic_file_duplicate action:ga_action_start label:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [[mpic singleton] duplicatepic:detail.pic];
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [detail.controller.navigationController popViewControllerAnimated:YES];
                                      });
                   });
}

@end