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
                       self.focusamount = [rawfocus[@"amount"] unsignedIntegerValue] / 1000.0;
                       
                       query = @"SELECT automatic, duration, iso FROM exposure WHERE id=1;";
                       
                       NSDictionary *rawexposure = [dbcon row:query];
                       self.exposureautomatic = [rawexposure[@"automatic"] boolValue];
                       self.exposureduration = [rawexposure[@"duration"] unsignedIntegerValue] / 1000.0;
                       self.exposureiso = [rawexposure[@"iso"] unsignedIntegerValue] / 1000.0;
                       
                       query = @"SELECT type FROM flash WHERE id=1;";
                       
                       NSNumber *rawflashtype = [dbcon value:query];
                       self.flashtype = (cam_flash)[rawflashtype integerValue];
                       
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
                       
                       NSUInteger amountint = self.focusamount * 1000;
                       
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE focus SET automatic=%@, amount=%@ where id=1;",
                                          newauto, @(amountint)];
                       
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
                       
                       NSUInteger durationint = duration * 1000;
                       NSUInteger isoint = iso * 1000;
                       
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE exposure SET automatic=%@, duration=%@, iso=%@ WHERE id=1;",
                                          newauto, @(durationint), @(isoint)];
                       
                       [db query:query];
                   });
}

-(void)flashtype:(cam_flash)flashtype
{
    self.flashtype = flashtype;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE flash SET type=%@ id=1;",
                                          @(flashtype)];
                       
                       [db query:query];
                   });
}

@end