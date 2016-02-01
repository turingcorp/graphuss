#import "vspinnerlines.h"

@implementation vspinnerlines

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat width_2 = width / 2.0;
    CGFloat height_2 = height / 2.0;
    CGFloat lineheight = 10;
    CGFloat side = fmin(width, height) - lineheight;
    CGFloat side_2 = side / 2.0;
    NSUInteger lines = 70;
    NSUInteger lines2 = lines * 2;
    CGFloat totalrad = 6.28319;
    CGFloat radline = totalrad / lines2;
    CGFloat radline2 = radline * 2;
    CGFloat start = 0;
    CGFloat end = radline;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineheight);
    CGContextSetStrokeColorWithColor(context, colormain.CGColor);
    CGContextSetFillColorWithColor(context, colormain.CGColor);
    
    for(NSUInteger i = 0; i < lines; i++)
    {
        CGContextAddArc(context, width_2, height_2, side_2, start, end, 0);
        CGContextDrawPath(context, kCGPathStroke);
        
        start += radline2;
        end += radline2;
    }
    
    CGContextAddArc(context, width_2, height_2, side / 2.4, 0.0001, 0, 0);
    CGContextDrawPath(context, kCGPathFill);
}

@end