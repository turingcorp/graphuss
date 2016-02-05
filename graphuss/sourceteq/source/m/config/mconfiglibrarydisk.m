#import "mconfiglibrarydisk.h"

@implementation mconfiglibrarydisk

#pragma mark -
#pragma mark library protocol

-(NSString*)descr
{
    NSString *descr = NSLocalizedString(@"config_library_disk_descr", nil);
    
    return descr;
}

-(NSString*)actionname
{
    NSString *name = NSLocalizedString(@"config_library_disk_actionname", nil);
    
    return name;
}

-(void)selected
{
    
}

@end