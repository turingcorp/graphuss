#import "mcamitem.h"
#import "vcammenuoptions.h"

@implementation mcamitem

-(instancetype)init
{
    self = [super init];
    
    self.title = @"";
    
    return self;
}

#pragma mark public

-(void)selected:(vcammenuoptions*)options
{
    [options.overview removeFromSuperview];
}

@end