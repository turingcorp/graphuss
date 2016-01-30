#import <Foundation/Foundation.h>

@class mgraphicspixel;

@protocol mgraphicsfilterprotocol <NSObject>

-(NSNumber*)applyto:(mgraphicspixel*)pixel;

@end