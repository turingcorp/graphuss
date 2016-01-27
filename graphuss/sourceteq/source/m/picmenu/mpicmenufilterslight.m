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
    
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[filter]-50-|" options:0 metrics:metrics views:views]];
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[filter(100)]-150-|" options:0 metrics:metrics views:views]];
}

@end