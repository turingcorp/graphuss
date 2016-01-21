#import "appdel.h"

@interface msession:NSObject

+(instancetype)singleton;

@property(copy, nonatomic)NSString *userid;

@end