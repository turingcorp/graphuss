#import <UIKit/UIKit.h>

@class ccam;

@interface mcamflashitem:NSObject

-(void)selected:(ccam*)controller;
-(BOOL)equalstype:(NSInteger)type;

@property(copy, nonatomic)NSString *name;

@end