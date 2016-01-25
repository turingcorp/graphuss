#import "vpicdetailedit.h"

@implementation vpicdetailedit

-(instancetype)init:(vpicdetail*)detail
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.detail = detail;
    
    UIBarButtonItem *itemrotateleft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actionrotateleft)];
    
    UIBarButtonItem *itemflex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *itemrotateright = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actionrotateright)];
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setTranslucent:YES];
    [toolbar setTintColor:colormain];
    [toolbar setItems:@[itemrotateleft, itemflex, itemrotateright] animated:NO];
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
    [self.detail.controllerdetail edit_rotateleft];
}

-(void)actionrotateright
{
    [self.detail.controllerdetail edit_rotateright];
}

#pragma mark functionality

-(void)rotate:(UIImageOrientation)orientation
{
    UIImage *original = self.detail.image.image;
    UIImage *oriented = [UIImage imageWithCGImage:original.CGImage scale:1 orientation:orientation];
    
    [self.detail.image setImage:oriented];
    [self.detail.pic update:oriented];
}

@end