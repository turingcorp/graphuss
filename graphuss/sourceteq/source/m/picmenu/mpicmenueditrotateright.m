#import "mpicmenueditrotateright.h"

@implementation mpicmenueditrotateright

#pragma mark -
#pragma mark edit protocol

-(NSString*)image
{
    return @"rotateright";
}

-(void)action:(vpicdetail*)detail
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    [detail rotate:YES];
}

@end