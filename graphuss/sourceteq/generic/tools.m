#import "tools.h"

@implementation tools
{
    CFStringRef stringref;
}

+(instancetype)singleton
{
    static tools *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

+(void)rateapp
{
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", [properties valueForKey:@"appid"]]]];
}

+(NSDictionary*)defaultdict
{
    return [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"defs" withExtension:@"plist"]];
}

+(NSInteger)timestamp
{
    return [NSDate date].timeIntervalSince1970;
}

+(UIImage*)qrcode:(NSString*)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *ciimage = filter.outputImage;
    CIImage *scaleimage = [ciimage imageByApplyingTransform:CGAffineTransformMakeScale(10, 10)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimage = [context createCGImage:scaleimage fromRect:scaleimage.extent];
    UIImage *uiimage = [UIImage imageWithCGImage:cgimage scale:1 orientation:UIImageOrientationUp];
    CFRelease(cgimage);
    
    return uiimage;
}

+(NSString*)typetokey:(NSInteger)type
{
    return [NSString stringWithFormat:@"%@", @(type)];
}

#pragma mark -

-(instancetype)init
{
    self = [super init];
    
    stringref = (CFStringRef)@"!*'();:@&=+$,/?%#[]";
    
    return self;
}

#pragma mark public

-(NSString*)urlencode:(NSString*)string
{
    return (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(nil, (__bridge CFStringRef)string, nil, stringref, kCFStringEncodingUTF8);
}

@end