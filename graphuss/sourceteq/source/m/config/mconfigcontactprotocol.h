#import <UIKit/UIKit.h>

@class vconfigcontact;

@protocol mconfigcontactprotocol <NSObject>

-(NSString*)title;
-(void)selected:(vconfigcontact*)view;

@end