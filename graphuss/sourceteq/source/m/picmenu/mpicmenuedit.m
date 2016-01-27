#import "mpicmenuedit.h"

@implementation mpicmenuedit
{
    NSArray *array;
}

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_edit", nil);
}

-(void)selected:(vpicdetail*)detail
{
    vpicdetailedit *edit = [[vpicdetailedit alloc] init:detail];
    [detail overrideoverview:edit];
    
    NSDictionary *views = @{@"edit":edit};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[edit]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[edit(60)]-80-|" options:0 metrics:metrics views:views]];
}

-(NSInteger)count
{
    if(!array)
    {
        array = [NSArray arrayWithObjects:
                 [[mpicmenueditrotateleft alloc] init],
                 [[mpicmenueditrotateright alloc] init],
                 nil];
    }
    
    return array.count;
}

-(id)item:(NSInteger)index
{
    return array[index];
}

@end