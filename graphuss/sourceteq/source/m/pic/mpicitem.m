#import "mpicitem.h"

@implementation mpicitem
{
    UIImage *thumb;
}

-(instancetype)init:(NSNumber*)picid created:(NSNumber*)created syncstamp:(NSNumber*)syncstamp
{
    self = [super init];
    
    self.picid = picid.integerValue;
    self.created = created.integerValue;
    self.syncstamp = syncstamp.integerValue;
    
    return self;
}

#pragma mark public

-(UIImage*)thumb
{
    if(!thumb)
    {
        thumb = [UIImage imageWithContentsOfFile:[[mpic singleton] fileforthumb:self.picid]];
    }
    
    return thumb;
}

@end