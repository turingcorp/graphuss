#import "mpicmenufileshare.h"

@implementation mpicmenufileshare

#pragma mark -
#pragma mark file protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_file_share", nil);
}

-(void)action:(vpicdetail*)detail
{
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[detail.pic.imagehd] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = detail.menu;
        act.popoverPresentationController.sourceRect = CGRectMake((detail.menu.frame.size.width / 2) - 2, 5, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:nil];
}

@end