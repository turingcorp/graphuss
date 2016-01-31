#import "mpicmenufilterscolor.h"

@implementation mpicmenufilterscolor
{
    NSArray *array;
}

#pragma mark public

-(NSInteger)count
{
    if(!array)
    {
        
    }
    
    NSInteger count = array.count;
    
    return count;
}

-(id)item:(NSInteger)index
{
    id item = array[index];
    
    return item;
}

#pragma mark -
#pragma mark filters protocol

-(NSString*)image
{
    NSString *string = @"scale";
    
    return string;
}

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_filters_menu_colors", nil);
    
    return string;
}

-(void)action:(vpicdetailfilters*)filters
{
    [filters.overview removeFromSuperview];
    
    vpicdetailfilterscolor *filter = [[vpicdetailfilterscolor alloc] init:filters model:self];
    filters.overview = filter;
    
    [filters addSubview:filter];
    
    NSDictionary *views = @{@"filter":filter};
    NSDictionary *metrics = @{};
    
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[filter]-0-|" options:0 metrics:metrics views:views]];
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[filter]-60-|" options:0 metrics:metrics views:views]];
}

@end