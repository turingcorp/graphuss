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

-(void)focusamount:(CGFloat)focusamount
{
    self.focusamount = focusamount;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE focus SET amount=%@ WHERE id=1;",
                                          ];
                       
                       [db query:query];
                   });
}

-(void)exposureauto:(BOOL)exposureauto
{
    self.exposureautomatic = exposureauto;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSNumber *newvalue;
                       
                       if(exposureauto)
                       {
                           newvalue = @1;
                       }
                       else
                       {
                           newvalue = @0;
                       }
                       
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE exposure SET automatic=%@ WHERE id=1;",
                                          newvalue];
                       
                       [db query:query];
                   });
}

-(void)exposureduration:(CGFloat)exposureduration
{
    self.exposureduration = exposureduration;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE exposure SET duration=%@ WHERE id=1;",
                                          @(self.exposureduration * 1000)];
                       
                       [db query:query];
                   });
}

-(void)exposureaiso:(CGFloat)exposureiso
{
    self.exposureiso = exposureiso;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE exposure SET iso=%@ WHERE id=1;",
                                          @(self.exposureiso * 1000)];
                       
                       [db query:query];
                   });
}

@end