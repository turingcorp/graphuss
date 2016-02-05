#import "mconfiglibrarydisk.h"

@implementation mconfiglibrarydisk

#pragma mark -
#pragma mark library protocol

-(void)descr:(UILabel*)label
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *pictures = [manager contentsOfDirectoryAtPath:[mpic singleton].imagesfolder error:nil];
    NSLog(@"%@", pictures);
    NSUInteger count = pictures.count;
    NSUInteger size = 0;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSString *picture = pictures[i];
        NSDictionary *attributes = [manager attributesOfItemAtPath:[[mpic singleton].imagesfolder stringByAppendingPathComponent:picture] error:nil];
        size += [attributes fileSize];
    }
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