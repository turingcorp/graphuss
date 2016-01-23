#import "mpicitem.h"

@implementation mpicitem

-(instancetype)init:(NSNumber*)picid name:(NSString*)name
{
    self = [super init];
    
    self.picid = picid.integerValue;
    self.name = name;
    self.thumb = [UIImage imageWithContentsOfFile:[[mpic singleton] fileforthumb:self.name]];
    self.width = self.thumb.size.width;
    self.height = self.thumb.size.height;
    
    NSLog(@"%@:%@", @(self.width), @(self.height));
    
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

-(void)update:(UIImage*)image
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       self.width = image.size.width;
                       self.height = image.size.height;
                       
                       [[mpic singleton] update:self.name image:image];
                   });
}

@end