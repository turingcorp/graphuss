#import "appdel.h"

@interface mdirs:NSObject

+(void)createdir:(NSURL*)dirname;
+(void)deletefile:(NSString*)filename dir:(BOOL)dir;
+(void)deletecontents:(NSString*)folder;
+(void)copyfilefrom:(NSString*)origin to:(NSString*)to;
+(NSUInteger)bytesinfolder:(NSString*)folderpath;

@end