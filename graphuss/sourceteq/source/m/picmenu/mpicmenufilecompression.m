#import "mpicmenufilecompression.h"

@implementation mpicmenufilecompression

#pragma mark -
#pragma mark file protocol

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"pic_detail_file_compression", nil);
    
    return string;
}

-(void)action:(vpicdetail*)detail
{
    [[analytics singleton] trackevent:ga_event_pic_file_compress action:ga_action_start label:nil];
    
    vpicdetailfilecompress *compress = [[vpicdetailfilecompress alloc] init:detail];
    [detail addSubview:compress];
    
    NSDictionary *views = @{@"compress":compress};
    NSDictionary *metrics = @{};
    
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[compress]-0-|" options:0 metrics:metrics views:views]];
    [detail addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[compress]-0-|" options:0 metrics:metrics views:views]];
}

@end