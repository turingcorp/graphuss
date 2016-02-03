#import <UIKit/UIKit.h>

@class vcammenuoptions;

@interface mcamitem:NSObject

-(void)selected:(vcammenuoptions*)options;

@property(copy, nonatomic)NSString *title;

@end