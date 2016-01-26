#import "mpicmenufile.h"

@implementation mpicmenufile
{
    NSArray *array;
}

#pragma mark -
#pragma mark menu protocol

-(NSString*)title
{
    return NSLocalizedString(@"pic_detail_menu_file", nil);
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
    
    return array.count;
}

-(id)item:(NSInteger)index
{
    return array[index];
}

@end