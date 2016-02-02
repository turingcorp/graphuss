#import "vcammenulast.h"

@implementation vcammenulast

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setBorderWidth:1];
    [self.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.1].CGColor];
    [self.layer setCornerRadius:4];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

@end