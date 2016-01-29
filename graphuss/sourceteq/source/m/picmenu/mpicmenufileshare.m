#import "mpicmenufileshare.h"

@implementation mpicmenufileshare

#pragma mark -
#pragma mark file protocol

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_file_share", nil);
    
    return string;
}

-(void)action:(vpicdetail*)detail
{
    [[analytics singleton] trackevent:ga_event_pic_file_share action:ga_action_start label:nil];
    
    NSURL *url = [NSURL fileURLWithPath:[detail.pic fileforimage]];
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = detail.menu;
        act.popoverPresentationController.sourceRect = CGRectMake((detail.menu.frame.size.width / 2) - 2, 5, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:nil];
}

@end