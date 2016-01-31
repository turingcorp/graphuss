#import <Foundation/Foundation.h>
#import "mgraphicsfilterprotocol.h"

@protocol mpicmenufiltersbwprotocol <NSObject>

-(NSString*)title;
-(id<mgraphicsfilterprotocol>)filter;

@end