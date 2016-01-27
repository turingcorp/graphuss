#import "cpicdetail.h"

@implementation cpicdetail

-(instancetype)init:(mpicitem*)pic
{
    self = [super init];
    
    self.pic = pic;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    [self setTitle:NSLocalizedString(@"pic_detail_title", nil)];
    [[analytics singleton] trackscreen:ga_screen_pic_detail];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController.interactivePopGestureRecognizer setEnabled:NO];
    
    if(!self.viewdetail.menu)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    }
    
    [self loadimage];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.interactivePopGestureRecognizer setEnabled:YES];
}

-(void)loadView
{
    self.view = [[vpicdetail alloc] init:self];
    self.viewdetail = (vpicdetail*)self.view;
}

#pragma mark functionality

-(void)loadimage
{
    __weak cpicdetail *weakself = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       weakself.image = [UIImage imageWithContentsOfFile:[weakself.pic fileforimage]];
                       weakself.pic.imagehd = weakself.image;
                       [weakself loadviewpic];
                   });
}

-(void)loadviewpic
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.viewdetail loadpic:self.pic];
                       [self.viewdetail loadmenu];
                       
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                                      ^
                                      {
                                          [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
                                      });
                   });
}

-(void)changeorientation:(UIImageOrientation)neworientation
{
    self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:neworientation];
    [self.pic update:self.image];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
}

#pragma mark public

-(void)edit_rotateleft
{
    [[analytics singleton] trackevent:ga_event_pic_edit_rotate action:ga_action_left label:nil];
    
    UIImageOrientation next;
    
    switch(self.image.imageOrientation)
    {
        case UIImageOrientationDown:
            
            next = UIImageOrientationRight;
            
            break;
            
        case UIImageOrientationUp:
            
            next = UIImageOrientationLeft;
            
            break;
            
        case UIImageOrientationLeft:
            
            next = UIImageOrientationDown;
            
            break;
            
        case UIImageOrientationRight:
            
            next = UIImageOrientationUp;
            
            break;
            
        case UIImageOrientationDownMirrored:
            
            next = UIImageOrientationRightMirrored;
            
            break;
            
        case UIImageOrientationLeftMirrored:
            
            next = UIImageOrientationDownMirrored;
            
            break;
            
        case UIImageOrientationRightMirrored:
            
            next = UIImageOrientationUpMirrored;
            
            break;
            
        case UIImageOrientationUpMirrored:
            
            next = UIImageOrientationLeftMirrored;
            
            break;
    }
    
    [self changeorientation:next];
}

-(void)edit_rotateright
{
    [[analytics singleton] trackevent:ga_event_pic_edit_rotate action:ga_action_right label:nil];
    
    UIImageOrientation next;
    
    switch(self.image.imageOrientation)
    {
        case UIImageOrientationDown:
            
            next = UIImageOrientationLeft;
            
            break;
            
        case UIImageOrientationUp:
            
            next = UIImageOrientationRight;
            
            break;
            
        case UIImageOrientationLeft:
            
            next = UIImageOrientationUp;
            
            break;
            
        case UIImageOrientationRight:
            
            next = UIImageOrientationDown;
            
            break;
            
        case UIImageOrientationDownMirrored:
            
            next = UIImageOrientationLeftMirrored;
            
            break;
            
        case UIImageOrientationLeftMirrored:
            
            next = UIImageOrientationUpMirrored;
            
            break;
            
        case UIImageOrientationRightMirrored:
            
            next = UIImageOrientationDownMirrored;
            
            break;
            
        case UIImageOrientationUpMirrored:
            
            next = UIImageOrientationRightMirrored;
            
            break;
    }
    
    [self changeorientation:next];
}

-(void)edit_compress:(CGFloat)quality
{
    self.image = [UIImage imageWithData:UIImageJPEGRepresentation(self.image, quality)];
    [self.pic update:self.image];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:notrefrespic object:nil];
}

-(void)edit_scale:(CGFloat)scale
{
    self.image = [mpic scaleimage:self.image scale:scale];
    [self.pic update:self.image];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingfree object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:notrefrespic object:nil];
}

@end