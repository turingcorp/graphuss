#import <UIKit/UIKit.h>
#import "mgraphicsfilterprotocol.h"

@protocol mpicmenufiltersbwprotocol <NSObject>

-(NSString*)title;
-(id<mgraphicsfilterprotocol>)filter;

@end