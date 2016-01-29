#import "mpicitem.h"

@implementation mpicitem

-(instancetype)init:(NSNumber*)picid name:(NSString*)name firsttime:(NSNumber*)firsttime
{
    self = [super init];
    
    self.picid = picid.integerValue;
    self.name = name;
    self.firsttime = firsttime.boolValue;
    
    [self loadthumb];
    
    return self;
}

#pragma mark functionality

-(void)loadthumb
{
    self.thumb = [UIImage imageWithContentsOfFile:[self fileforthumb]];
    self.width = self.thumb.size.width;
    self.height = self.thumb.size.height;
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
    [[mpic singleton] update:self.name image:image];
    [self loadthumb];
}

-(NSString*)fileforimage
{
    NSString *string = [[mpic singleton] fileforimage:self.name];
    
    return string;
}

-(NSString*)fileforthumb
{
    NSString *string = [[mpic singleton] fileforthumb:self.name];
    
    return string;
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