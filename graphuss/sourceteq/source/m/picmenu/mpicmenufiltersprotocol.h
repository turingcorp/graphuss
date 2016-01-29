#import <UIKit/UIKit.h>

@class vpicdetailfilters;

@protocol mpicmenufiltersprotocol <NSObject>

-(NSString*)image;
-(NSString*)title;
-(void)action:(vpicdetailfilters*)filters;

@end