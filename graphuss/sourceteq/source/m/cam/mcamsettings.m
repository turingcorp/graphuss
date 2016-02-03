#import "mcamsettings.h"

@implementation mcamsettings

+(instancetype)singleton
{
    static mcamsettings *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(void)refresh
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *query;
                       query = @"SELECT automatic, amount FROM focus where id=1;";
                       
                       db *dbcon = [db begin];
                       
                       NSDictionary *rawfocus = [dbcon row:query];
                       self.focusautomatic = [rawfocus[@"automatic"] boolValue];
                       self.focusamount = [rawfocus[@"amount"] unsignedIntegerValue];
                       
                       [dbcon commit];
                   });
}

@end