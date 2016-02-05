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

+(void)deletecontents:(NSString*)folder
{
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isdirectory;
    
    if([manager fileExistsAtPath:folder isDirectory:&isdirectory])
    {
        if(isdirectory)
        {
            NSArray *files = [manager contentsOfDirectoryAtPath:folder error:nil];
            NSUInteger count = files.count;
            
            for(NSUInteger i = 0; i < count; i++)
            {
                NSString *file = files[i];
                NSString *filepath = [folder stringByAppendingPathComponent:file];
                NSURL *fileurl = [NSURL fileURLWithPath:filepath isDirectory:NO];
                [manager removeItemAtURL:fileurl error:nil];
            }
        }
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

+(NSUInteger)bytesinfolder:(NSString*)folderpath
{
    NSUInteger size = 0;
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *files = [manager contentsOfDirectoryAtPath:folderpath error:nil];
    NSUInteger count = files.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSString *file = files[i];
        NSString *filepath = [folderpath stringByAppendingPathComponent:file];
        NSDictionary *attributes = [manager attributesOfItemAtPath:filepath error:nil];
        size += [attributes fileSize];
    }
    
    return size;
}

@end