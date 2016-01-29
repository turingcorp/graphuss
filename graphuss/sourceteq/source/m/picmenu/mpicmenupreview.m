#import "mpicmenupreview.h"

@implementation mpicmenupreview

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_menu_preview", nil);
    
    return string;
}

-(void)selected:(vpicdetail*)detail
{
    vpicdetailpreview *preview = [[vpicdetailpreview alloc] init:detail];
    [detail overrideoverview:preview];
    
    NSDictionary *views = @{@"preview":preview};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[preview]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[preview]-80-|" options:0 metrics:metrics views:views]];
}

@end