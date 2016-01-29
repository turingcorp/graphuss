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
    vpicdetailfile *file = [[vpicdetailfile alloc] init:detail model:self];
    [detail overrideoverview:file];
    
    NSDictionary *views = @{@"file":file};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[file]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[file]-80-|" options:0 metrics:metrics views:views]];
}

@end