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

-(void)focusauto:(BOOL)automatic amount:(CGFloat)amount
{
    self.focusautomatic = automatic;
    self.focusamount = amount;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSNumber *newauto;
                       
                       if(automatic)
                       {
                           newauto = @1;
                       }
                       else
                       {
                           newauto = @0;
                       }
                       
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE focus SET automatic=%@, amount=%@ WHERE id=1;",
                                          newauto, @(self.focusamount * 1000)];
                       
                       [db query:query];
                   });
}

-(void)exposureauto:(BOOL)automatic duration:(CGFloat)duration iso:(CGFloat)iso
{
    self.exposureautomatic = automatic;
    self.exposureduration = duration;
    self.exposureiso = iso;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSNumber *newauto;
                       
                       if(automatic)
                       {
                           newauto = @1;
                       }
                       else
                       {
                           newauto = @0;
                       }
                       
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE exposure SET automatic=%@, duration=%@, iso=%@ WHERE id=1;",
                                          newauto, @(self.exposureduration * 1000), @(self.exposureiso * 1000)];
                       
                       [db query:query];
                   });
}

@end