#import "mcamitem.h"
#import "vcam.h"

@implementation mcamitem

-(instancetype)init
{
    self = [super init];
    
    self.title = @"";
    
    return self;
}

#pragma mark public

-(void)selected:(vcam*)viewcam
{
    [viewcam.overview removeFromSuperview];
}

@end