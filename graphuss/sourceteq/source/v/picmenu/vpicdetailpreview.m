#import "vpicdetailpreview.h"

@implementation vpicdetailpreview

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.detail = detail;
    
    return self;
}

@end