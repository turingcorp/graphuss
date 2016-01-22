#import "mpic.h"

@implementation mpic
{
    NSMutableArray *array;
}

+(instancetype)singleton
{
    static mpic *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    self.imagesfolder = [documents stringByAppendingPathComponent:@"images"];
    self.thumbsfolder = [documents stringByAppendingPathComponent:@"thumbs"];
    
    [self loadpics];
    
    return self;
}

#pragma mark functionality

-(void)loadpics
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       array = [NSMutableArray array];
                       
                       NSString *query = @"SELECT id, created, syncstamp FROM pic ORDER BY created asc;";
                       NSArray *rawpics = [db rows:query];
                       NSInteger count = rawpics.count;
                       
                       for(NSInteger i = 0; i < count; i++)
                       {
                           NSDictionary *rawpic = rawpics[i];
                           NSInteger
                       }
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notreloadpics object:nil];
                   });
}

#pragma mark public

-(void)firsttime
{
    [mdirs createdir:[NSURL fileURLWithPath:self.imagesfolder]];
    [mdirs createdir:[NSURL fileURLWithPath:self.thumbsfolder]];
}

-(NSString*)fileforimage:(NSInteger)picid
{
    return [self.imagesfolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", @(picid)]];
}

-(NSString*)fileforthumb:(NSInteger)picid
{
    return [self.thumbsfolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", @(picid)]];
}

-(void)savepic:(UIImage*)pic
{
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO pic (created, syncstamp) values(%@, %@);",
                       @(now), @(now)];
    NSInteger picid = [db query_identity:query];
    
    NSURL *imageurl = [self urlforimage:picid];
    NSURL *thumburl = [self urlforthumb:picid];
    
    [UIImageJPEGRepresentation(pic, 1) writeToURL:imageurl atomically:YES];
    [UIImageJPEGRepresentation(pic, 0.01) writeToURL:thumburl atomically:YES];
    
    [self loadpics];
}

@end