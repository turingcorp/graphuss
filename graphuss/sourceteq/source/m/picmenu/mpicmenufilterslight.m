#import "mpicmenufilterslight.h"

@implementation mpicmenufilterslight

#pragma mark -
#pragma mark filters protocol

-(NSString*)image
{
    NSString *string = @"light";
    
    return string;
}

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_filters_menu_light", nil);
    
    return string;
}

-(void)action:(vpicdetailfilters*)filters
{
    [filters.overview removeFromSuperview];
    
    vpicdetailfilterslight *filter = [[vpicdetailfilterslight alloc] init:filters];
    filters.overview = filter;
    
    [filters addSubview:filter];
    
    NSDictionary *views = @{@"filter":filter};
    NSDictionary *metrics = @{};
    
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[filter]-0-|" options:0 metrics:metrics views:views]];
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[filter]-60-|" options:0 metrics:metrics views:views]];
}

@end