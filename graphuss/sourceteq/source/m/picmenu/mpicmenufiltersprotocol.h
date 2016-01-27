#import <UIKit/UIKit.h>

@class vpicdetailfilters;

@protocol mpicmenufiltersprotocol <NSObject>

-(NSString*)image;
-(void)action:(vpicdetailfilters*)filters;

@end