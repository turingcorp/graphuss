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
    self.thumb = [UIImage imageWithContentsOfFile:[[mpic singleton] fileforthumb:self.picid]];
    self.width = self.thumb.size.width;
    self.height = self.thumb.size.height;
    
    return self;
}

@end