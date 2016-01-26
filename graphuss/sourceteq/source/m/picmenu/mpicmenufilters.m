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
    vpicdetailfilters *filters = [[vpicdetailfilters alloc] init:detail];
    [detail overrideoverview:filters];
    
    NSDictionary *views = @{@"filters":filters};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[filters]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[filters(100)]-80-|" options:0 metrics:metrics views:views]];
}

@end