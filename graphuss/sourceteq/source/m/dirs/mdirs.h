#import "appdel.h"

@interface mdirs:NSObject

+(void)createdir:(NSURL*)dirname;
+(void)deletefile:(NSString*)filename dir:(BOOL)dir;
+(void)copyfilefrom:(NSString*)origin to:(NSString*)to;

@end