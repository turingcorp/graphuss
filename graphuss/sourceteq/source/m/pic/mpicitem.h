#import "appdel.h"

@interface mpicitem:NSObject

-(instancetype)init:(NSNumber*)picid name:(NSString*)name;
-(CGFloat)heightforwidth:(CGFloat)width;
-(void)update:(UIImage*)image;
-(NSString*)fileforimage;

@property(strong, nonatomic)UIImage *thumb;
@property(weak, nonatomic)UIImage *imagehd;
@property(copy, nonatomic)NSString *name;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)NSInteger picid;

@end