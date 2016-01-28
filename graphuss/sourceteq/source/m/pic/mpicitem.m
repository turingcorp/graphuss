#import "mpicitem.h"

@implementation mpicitem

-(instancetype)init:(NSNumber*)picid name:(NSString*)name firsttime:(NSNumber*)firsttime
{
    self = [super init];
    
    self.picid = picid.integerValue;
    self.name = name;
    self.thumb = [UIImage imageWithContentsOfFile:[self fileforthumb]];
    self.width = self.thumb.size.width;
    self.height = self.thumb.size.height;
    self.firsttime = firsttime.boolValue;
    
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
    self.imagehd = image;
    self.width = image.size.width;
    self.height = image.size.height;
    
    [[mpic singleton] update:self.name image:image];
}

-(NSString*)fileforimage
{
    return [[mpic singleton] fileforimage:self.name];
}

-(NSString*)fileforthumb
{
    return [[mpic singleton] fileforthumb:self.name];
}

-(void)loadedfirsttime
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       self.firsttime = NO;
                       
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE pic SET firsttime=0 WHERE id=%@;",
                                          @(self.picid)];
                       
                       [db query:query];
                   });
}

@end