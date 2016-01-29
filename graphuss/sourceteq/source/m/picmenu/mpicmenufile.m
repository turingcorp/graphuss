#import "mpicmenufile.h"

@implementation mpicmenufile
{
    NSArray *array;
}

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_menu_file", nil);
    
    return string;
}

-(void)selected:(vpicdetail*)detail
{
    vpicdetailfile *file = [[vpicdetailfile alloc] init:detail model:self];
    [detail overrideoverview:file];
    
    NSDictionary *views = @{@"file":file};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[file]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[file]-80-|" options:0 metrics:metrics views:views]];
}

-(NSInteger)count
{
    if(!array)
    {
        array = [NSArray arrayWithObjects:
                 [[mpicmenufileduplicate alloc] init],
                 [[mpicmenufileshare alloc] init],
                 [[mpicmenufilecompression alloc] init],
                 [[mpicmenufiledelete alloc] init],
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