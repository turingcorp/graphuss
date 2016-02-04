#import <UIKit/UIKit.h>

@class ccam;

@interface mcamflashitem:NSObject

-(void)selected:(ccam*)controller;

@property(copy, nonatomic)NSString *name;

@end