#import <UIKit/UIKit.h>

@class vcam;

@interface mcamitem:NSObject

-(void)selected:(vcam*)viewcam;

@property(copy, nonatomic)NSString *title;

@end