#import "mconfiglibrarydisk.h"

@implementation mconfiglibrarydisk

#pragma mark -
#pragma mark library protocol

-(void)descr:(UILabel*)label
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSUInteger size = 0;
                       size += [mdirs bytesinfolder:[mpic singleton].imagesfolder];
                       size += [mdirs bytesinfolder:[mpic singleton].thumbsfolder];
                       double floatsize = size / 1000000;
                       
                       NSString *sizestring = [[tools singleton] numbertostring:@(floatsize)];
                       NSString *string = [NSString stringWithFormat:NSLocalizedString(@"config_library_disk_descr", nil), sizestring];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [label setText:string];
                                      });
                   });
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