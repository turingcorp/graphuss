#import "ccam.h"

@implementation ccam

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [valert alert:@"jumping like a frog in fire, keep jumping like a frog in fire" inview:self.view];
}

-(void)loadView
{
    self.view = [[vcam alloc] init:self];
}

#pragma mark functionality

-(void)auth
{
    
    /*
    [AVCaptureDevice ];
    
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:
     ^(BOOL _granted)
     {
         if(_granted)
         {
             [self start];
         }
         else
         {
             [ctralert alert:NSLocalizedString(@"error_notauthorized", nil)];
         }
     }];*/
}

@end