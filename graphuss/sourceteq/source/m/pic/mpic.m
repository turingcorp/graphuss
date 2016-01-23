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
                       
                       NSString *query = @"SELECT id, name FROM pic ORDER BY id ASC;";
                       NSArray *rawpics = [db rows:query];
                       NSInteger count = rawpics.count;
                       
                       for(NSInteger i = 0; i < count; i++)
                       {
                           NSDictionary *rawpic = rawpics[i];
                           NSString *name = rawpic[@"name"];
                           NSNumber *picid = rawpic[@"id"];
                           
                           mpicitem *item = [[mpicitem alloc] init:picid name:name];
                           [array addObject:item];
                       }
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notreloadpics object:nil];
                   });
}

-(void)error:(NSString*)error
{
    [[analytics singleton] trackevent:ga_event_shoot action:ga_action_error label:error];
    NSLog(@"%@", error);
}

#pragma mark public

-(void)firsttime
{
    [mdirs createdir:[NSURL fileURLWithPath:self.imagesfolder]];
    [mdirs createdir:[NSURL fileURLWithPath:self.thumbsfolder]];
}

-(NSString*)fileforimage:(NSString*)picname
{
    return [self.imagesfolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.image", picname]];
}

-(NSString*)fileforthumb:(NSString*)picname
{
    return [self.thumbsfolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.thumb", picname]];
}

-(void)savepic:(UIImage*)pic
{
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *name = [NSString stringWithFormat:@"%@", @(now)];
    NSError *error;
    
    [UIImageJPEGRepresentation(pic, 1.0) writeToFile:[self fileforimage:name] options:NSDataWritingAtomic error:&error];
    
    if(error)
    {
        [self error:error.localizedDescription];
    }
    else
    {
        [UIImageJPEGRepresentation(pic, 0.0) writeToFile:[self fileforthumb:name] options:NSDataWritingAtomic error:&error];
        
        if(error)
        {
            [self error:error.localizedDescription];
        }
        else
        {
            NSString *query = [NSString stringWithFormat:
                               @"INSERT INTO pic (name) values(%@);",
                               name];
            [db query:query];
            
            [[analytics singleton] trackevent:ga_event_shoot action:ga_action_completed label:nil];
            [self loadpics];
        }
    }
}

-(NSInteger)count
{
    return array.count;
}

-(mpicitem*)item:(NSInteger)index
{
    return array[index];
}

@end