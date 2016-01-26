#import <UIKit/UIKit.h>

@class vpicdetail;

@protocol mpicmenuprotocol <NSObject>

-(NSString*)title;
-(void)selected:(vpicdetail*)detail;

@end