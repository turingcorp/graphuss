#import "vpicdetailedit.h"

@implementation vpicdetailedit
{
    CGFloat rotation;
}

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.detail = detail;
    rotation = 0;
    
    UIBarButtonItem *itemrotateleft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actionrotateleft)];
    
    UIBarButtonItem *itemflex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *itemrotateright = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actionrotateright)];
    
    UIBarButtonItem *itemscale = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(actionscale)];
    
    UIBarButtonItem *itemcrop = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(actioncrop)];
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setTranslucent:YES];
    [toolbar setTintColor:colormain];
    [toolbar setItems:@[itemrotateleft, itemflex, itemrotateright, itemflex, itemscale, itemflex, itemcrop] animated:NO];
    [toolbar setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:toolbar];
    
    NSDictionary *views = @{@"bar":toolbar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionrotateleft
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    [self rotate:NO];
}

-(void)actionrotateright
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notwritingbusy object:nil];
    [self rotate:YES];
}

-(void)actionscale
{
    [self.detail];
}

-(void)actioncrop
{
    
}

#pragma mark functionality

-(void)rotate:(CGFloat)clockwise
{
    CGFloat degrees = -90;
    
    if(clockwise)
    {
        degrees = 90;
    }
    
    rotation += degrees * M_PI / 180.0;
    CGAffineTransform transform = CGAffineTransformMakeRotation(rotation);
    
    [UIView animateWithDuration:0.3 animations:
     ^
     {
         [self.detail.image setTransform:transform];
         [self.detail.image setNeedsDisplay];
         [self.detail.image layoutIfNeeded];

     } completion:
     ^(BOOL done)
     {
         if(clockwise)
         {
             [self.detail.controllerdetail edit_rotateright];
         }
         else
         {
             [self.detail.controllerdetail edit_rotateleft];
         }
     }];
}

@end