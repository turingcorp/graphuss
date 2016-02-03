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
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setUserInteractionEnabled:NO];
    
    [self addSubview:image];
    
    return self;
}

#pragma mark public

-(void)refreshlast
{
    UIImage *image;
    NSInteger count = [mpic singleton].count;
    
    if(count)
    {
        mpicitem *item = [[mpic singleton] item:0];
        image = item.thumb;
    }
    
    [self.image setImage:image];
}

@end