#import "mpicitem.h"

@implementation mpicitem

-(instancetype)init:(NSNumber*)picid name:(NSString*)name
{
    self = [super init];
    
    self.picid = picid.integerValue;
    self.name = name;
    self.thumb = [UIImage imageWithContentsOfFile:[[mpic singleton] fileforthumb:self.picid]];
    self.width = self.thumb.size.width;
    self.height = self.thumb.size.height;
    
    return self;
}

#pragma mark public

-(CGFloat)heightforwidth:(CGFloat)width
{
    CGFloat height = 0;
    CGFloat ratio = self.width / width;
    
    if(ratio)
    {
        height = self.height / ratio;
    }
    
    return height;
}

@end