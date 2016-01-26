#import <Foundation/Foundation.h>

@class vpicdetail;

@protocol mpicmenufileprotocol <NSObject>

-(NSString*)title;
-(void)action:(vpicdetail*)detail;

@end