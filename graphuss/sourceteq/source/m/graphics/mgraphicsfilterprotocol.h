#import <Foundation/Foundation.h>

@class mgraphicspixel;

@protocol mgraphicsfilterprotocol <NSObject>

-(uint)applyto:(mgraphicspixel*)pixel;

@end