#import "mpicmenufilterslight.h"

@implementation mpicmenufilterslight

#pragma mark -
#pragma mark filters protocol

-(NSString*)image
{
    return @"light";
}

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_filters_menu_light", nil);
}

-(void)action:(vpicdetailfilters*)filters
{
    [filters.overview removeFromSuperview];
    
    vpicdetailfilterslight *filter = [[vpicdetailfilterslight alloc] init];
    filters.overview = filter;
    
    [filters addSubview:filter];
    
    NSDictionary *views = @{@"filter":filter};
    NSDictionary *metrics = @{};
    
    [filter addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[filters]-50-|" options:0 metrics:metrics views:views]];
    [filter addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[filters(100)]-150-|" options:0 metrics:metrics views:views]];
}

@end