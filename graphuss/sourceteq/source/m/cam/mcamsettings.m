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
                       query = @"SELECT automatic, amount FROM focus WHERE id=1;";
                       
                       db *dbcon = [db begin];
                       
                       NSDictionary *rawfocus = [dbcon row:query];
                       self.focusautomatic = [rawfocus[@"automatic"] boolValue];
                       self.focusamount = [rawfocus[@"amount"] unsignedIntegerValue] / 1000;
                       
                       query = @"SELECT automatic, duration, iso FROM exposure WHERE id=1;";
                       
                       NSDictionary *rawexposure = [dbcon row:query];
                       self.exposureautomatic = [rawexposure[@"automatic"] boolValue];
                       self.exposureduration = [rawexposure[@"duration"] unsignedIntegerValue] / 1000;
                       self.exposureiso = [rawexposure[@"iso"] unsignedIntegerValue] / 1000;
                       
                       [dbcon commit];
                   });
}

-(void)focusauto:(BOOL)focusautomatic
{
    self.focusautomatic = focusautomatic;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSNumber *newvalue;
                       
                       if(focusautomatic)
                       {
                           newvalue = @1;
                       }
                       else
                       {
                           newvalue = @0;
                       }
                       
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE focus set automatic=%@ where id=1;",
                                          newvalue];
                       
                       [db query:query];
                   });
}

-(void)focusamount:(CGFloat)focusamount
{
    self.focusamount = focusamount;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE focus set amount=%@ where id=1;",
                                          @(self.focusamount * 1000)];
                       
                       [db query:query];
                   });
}

-(void)exposureauto:(BOOL)exposureauto
{
    
}

-(void)exposureduration:(CGFloat)exposureduration
{
    
}

-(void)exposureaiso:(CGFloat)exposureiso
{
    
}

@end