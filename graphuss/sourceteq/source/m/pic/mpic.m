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
                       
                       NSString *query = @"SELECT id, firsttime, name FROM pic ORDER BY id DESC;";
                       NSArray *rawpics = [db rows:query];
                       NSInteger count = rawpics.count;
                       
                       for(NSInteger i = 0; i < count; i++)
                       {
                           NSDictionary *rawpic = rawpics[i];
                           NSString *name = rawpic[@"name"];
                           NSNumber *picid = rawpic[@"id"];
                           NSNumber *firsttime = rawpic[@"firsttime"];
                           
                           mpicitem *item = [[mpicitem alloc] init:picid name:name firsttime:firsttime];
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

-(BOOL)save:(NSString*)name image:(UIImage*)image
{
    BOOL success = YES;
    NSError *error;
    
    [UIImageJPEGRepresentation(image, 1.0) writeToFile:[self fileforimage:name] options:NSDataWritingAtomic error:&error];
    
    if(error)
    {
        success = NO;
        [self error:error.localizedDescription];
    }
    else
    {
        UIImage *imagescaled = image;
        
        CGFloat scale = 0.5;
        CGFloat compress = 0.3;
        NSInteger maxside = MAX(image.size.width, image.size.height);
        
        if(maxside > 1000)
        {
            scale = 0.1;
            compress = 0;
        }
        else if(maxside > 400)
        {
            scale = 0.25;
            compress = 0.15;
        }
        
        if(scale < 1)
        {
            imagescaled = [mgraphics scale:image at:scale];
        }
        
        [UIImageJPEGRepresentation(imagescaled, compress) writeToFile:[self fileforthumb:name] options:NSDataWritingAtomic error:&error];
        
        if(error)
        {
            success = NO;
            [self error:error.localizedDescription];
        }
    }

    return success;
}
            
#pragma mark public

-(void)firsttime
{
    [mdirs createdir:[NSURL fileURLWithPath:self.imagesfolder]];
    [mdirs createdir:[NSURL fileURLWithPath:self.thumbsfolder]];
}

-(NSString*)fileforimage:(NSString*)picname
{
    return [self.imagesfolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpeg", picname]];
}

-(NSString*)fileforthumb:(NSString*)picname
{
    return [self.thumbsfolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.thumb", picname]];
}

-(BOOL)savepic:(UIImage*)pic
{
    BOOL done = NO;
    
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *name = [NSString stringWithFormat:@"%@", @(now)];
    
    if([self save:name image:pic])
    {
        NSString *query = [NSString stringWithFormat:
                           @"INSERT INTO pic (name, firsttime) values(%@, 1);",
                           name];
        [db query:query];
        [self loadpics];
        done = YES;
    }
    
    return done;
}

-(void)deletepic:(mpicitem*)pic
{
    NSString *query = [NSString stringWithFormat:
                       @"DELETE FROM pic where id=%@;",
                       @(pic.picid)];
    
    [db query:query];
    
    [mdirs deletefile:[pic fileforimage] dir:NO];
    [mdirs deletefile:[pic fileforthumb] dir:NO];
    
    [self loadpics];
}

-(void)duplicatepic:(mpicitem*)pic
{
    [self savepic:pic.imagehd];
}

-(NSInteger)count
{
    return array.count;
}

-(mpicitem*)item:(NSInteger)index
{
    return array[index];
}

-(void)update:(NSString*)name image:(UIImage*)image
{
    [self save:name image:image];
    
    [self loadpics];
}

@end