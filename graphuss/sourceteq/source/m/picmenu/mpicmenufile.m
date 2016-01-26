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
    vpicdetailedit *edit = [[vpicdetailedit alloc] init:detail];
    [detail overrideoverview:edit];
    
    NSDictionary *views = @{@"edit":edit, @"menu":detail.menu};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[edit]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[edit(60)]-0-[menu]" options:0 metrics:metrics views:views]];
}

@end