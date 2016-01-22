#import "mpic.h"

@implementation mpic

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
    
    return self;
}

#pragma mark public

-(void)firsttime
{
    [mdirs createdir:[NSURL fileURLWithPath:self.imagesfolder]];
    [mdirs createdir:[NSURL fileURLWithPath:self.thumbsfolder]];
}

-(NSURL*)urlforimage:(NSInteger)picid
{
    return [NSURL fileURLWithPath:[self.imagesfolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", @(picid)]]];
}

-(NSURL*)urlforthum:(NSInteger)picid
{
    return [NSURL fileURLWithPath:[self.thumbsfolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", @(picid)]]];
}

@end