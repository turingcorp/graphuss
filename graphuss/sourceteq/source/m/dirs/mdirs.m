#import "mdirs.h"

@implementation mdirs

+(void)createdir:(NSURL*)dirname
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:dirname.absoluteString])
    {
        [manager createDirectoryAtURL:dirname withIntermediateDirectories:YES attributes:nil error:nil];
        [dirname setResourceValue:@YES forKey:NSURLIsExcludedFromBackupKey error:nil];
    }
}

+(void)deletefile:(NSString*)filename dir:(BOOL)dir
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if([manager fileExistsAtPath:filename])
    {
        NSURL *fileurl = [NSURL fileURLWithPath:filename isDirectory:dir];
        [manager removeItemAtURL:fileurl error:nil];
    }
}

+(void)copyfilefrom:(NSString*)origin to:(NSString*)to
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSURL *destinationurl = [NSURL fileURLWithPath:to];
    NSURL *originurl = [NSURL fileURLWithPath:origin];
    
    if([manager fileExistsAtPath:to])
    {
        [manager removeItemAtURL:destinationurl error:nil];
    }
    
    [manager copyItemAtURL:originurl toURL:destinationurl error:nil];
}

@end