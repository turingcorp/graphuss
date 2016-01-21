#import "appdel.h"

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(NSDictionary*)defaultdict;
+(NSInteger)timestamp;
+(UIImage*)qrcode:(NSString*)string;
+(NSString*)typetokey:(NSInteger)type;
-(NSString*)urlencode:(NSString*)string;

@end