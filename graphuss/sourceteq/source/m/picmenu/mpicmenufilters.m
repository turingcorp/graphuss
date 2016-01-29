#import "mpicmenufilters.h"

@implementation mpicmenufilters
{
    NSArray *array;
}

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_menu_filters", nil);
    
    return string;
}

-(void)selected:(vpicdetail*)detail
{
    vpicdetailfilters *filters = [[vpicdetailfilters alloc] init:detail model:self];
    [detail overrideoverview:filters];
    
    NSDictionary *views = @{@"filters":filters};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[filters]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[filters]-80-|" options:0 metrics:metrics views:views]];
}

-(NSInteger)count
{
    if(!array)
    {
        array = [NSArray arrayWithObjects:
                 [[mpicmenufilterslight alloc] init],
                 [[mpicmenufilterscolor alloc] init],
                 nil];
    }
    
    NSInteger count = array.count;
    
    return count;
}

-(id)item:(NSInteger)index
{
    id item = array[index];
    
    return item;
}

@end