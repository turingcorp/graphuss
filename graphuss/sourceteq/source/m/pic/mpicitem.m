#import "mpicitem.h"

@implementation mpicitem
{
    UIImage *thumb;
}

-(instancetype)init:(NSNumber*)picid created:(NSInteger)created syncstamp:(NSInteger)syncstamp
{
    self = [super init];
    
    self.picid = picid.integerValue;
    self.created = created;
    self.syncstamp = syncstamp;
    
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