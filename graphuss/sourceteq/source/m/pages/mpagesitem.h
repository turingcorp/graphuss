#import "appdel.h"

@interface mpagesitem:NSObject

-(app_page)pageleft;
-(app_page)pageright;
-(BOOL)showitemcamera;
-(BOOL)showitemlist;
-(BOOL)showitemconfig;
-(UIViewController*)controller;

@property(nonatomic)app_page page;

@end