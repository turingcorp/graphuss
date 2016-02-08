#import <Foundation/Foundation.h>
#import "mgraphicsfilterprotocol.h"

@protocol mpicmenufilterscolorprotocol <NSObject>

-(NSString*)title;
-(id<mgraphicsfilterprotocol>)filter;

@end