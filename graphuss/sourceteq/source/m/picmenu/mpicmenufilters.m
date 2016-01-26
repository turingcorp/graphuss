#import "mpicmenufilters.h"

@implementation mpicmenufilters

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_filters", nil);
}

-(void)selected:(vpicdetail*)detail
{
    vpicdetailedit *filters = [[vpicdetailedit alloc] init:detail];
    [detail overrideoverview:filters];
    
    NSDictionary *views = @{@"edit":edit};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[edit]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[edit(60)]-80-|" options:0 metrics:metrics views:views]];
}

@end