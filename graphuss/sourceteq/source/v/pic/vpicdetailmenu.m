#import "vpicdetailmenu.h"

@implementation vpicdetailmenu

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor grayColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

@end