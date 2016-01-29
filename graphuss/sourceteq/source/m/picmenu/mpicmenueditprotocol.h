#import <UIKit/UIKit.h>

@class vpicdetail;

@protocol mpicmenueditprotocol <NSObject>

-(NSString*)image;
-(void)action:(vpicdetail*)detail;

@end