#import "mpicmenufiltersbw.h"

@implementation mpicmenufiltersbw
{
    NSArray *array;
}

#pragma mark public

-(NSInteger)count
{
    if(!array)
    {
        array = [NSArray arrayWithObjects:
                 [[mpicmenufiltersbwbasic alloc] init],
                 [[mpicmenufiltersbwcontrast alloc] init],
                 [[mpicmenufiltersbwblue alloc] init],
                 nil];
    }
    
    NSInteger count = array.count;
    
    return count;
}

-(id<mpicmenufiltersbwprotocol>)item:(NSInteger)index
{
    id item = array[index];
    
    return item;
}

#pragma mark -
#pragma mark filters protocol

-(NSString*)image
{
    NSString *string = @"light";
    
    return string;
}

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_filters_menu_black_white", nil);
    
    return string;
}

-(void)action:(vpicdetailfilters*)filters
{
    [filters.overview removeFromSuperview];
    
    vpicdetailfiltersbw *filter = [[vpicdetailfiltersbw alloc] init:filters];
    filters.overview = filter;
    
    [filters addSubview:filter];
    
    NSDictionary *views = @{@"filter":filter};
    NSDictionary *metrics = @{};
    
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[filter]-0-|" options:0 metrics:metrics views:views]];
    [filters addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[filter]-60-|" options:0 metrics:metrics views:views]];
}

@end