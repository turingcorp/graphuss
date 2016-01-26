#import "mpicmenufile.h"

@implementation mpicmenufile

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_file", nil);
}

-(void)selected:(vpicdetail*)detail
{
    vpicdetailfile *file = [[vpicdetailfile alloc] init:detail];
    [detail overrideoverview:file];
    
    NSDictionary *views = @{@"file":file};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[file]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[file]-80-|" options:0 metrics:metrics views:views]];
}

@end