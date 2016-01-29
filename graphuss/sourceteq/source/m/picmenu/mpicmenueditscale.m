#import "mpicmenueditscale.h"

@implementation mpicmenueditscale

#pragma mark -
#pragma mark edit protocol

-(NSString*)image
{
    NSString *string = @"scale";
    
    return string;
}

-(void)action:(vpicdetail*)detail
{
    [[analytics singleton] trackevent:ga_event_pic_edit_scale action:ga_action_start label:nil];
    [vpicdetaileditscale askscale:detail];
}

@end