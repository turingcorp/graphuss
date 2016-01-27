#import "mpicmenueditrotateleft.h"

@implementation mpicmenueditrotateleft

#pragma mark -
#pragma mark edit protocol

-(NSString*)image
{
    return @"rotateleft";
}

-(void)action:(vpicdetail*)detail
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    [detail rotate:NO];
}

@end