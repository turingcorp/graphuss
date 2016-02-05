#import "vconfigabout.h"

@implementation vconfigabout

-(instancetype)init:(cconfigabout*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    NSDictionary *attrtitle = @{NSForegroundColorAttributeName:colormain, NSFontAttributeName:[UIFont fontWithName:fontboldname size:18]};
    NSDictionary *attrversion = @{NSForegroundColorAttributeName:colormain, NSFontAttributeName:[UIFont fontWithName:fontname size:12]};
    NSDictionary *attrcopy = @{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont fontWithName:fontname size:12]};
    
    NSAttributedString *strtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_about_in_title", nil) attributes:attrtitle];
    NSAttributedString *strversion = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:NSLocalizedString(@"config_about_in_descr", nil), [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]] attributes:attrversion];
    NSAttributedString *strcopy = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_about_in_copy", nil) attributes:attrcopy];
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:strtitle];
    [mut appendAttributedString:strversion];
    [mut appendAttributedString:strcopy];
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setUserInteractionEnabled:NO];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [logo setContentMode:UIViewContentModeScaleAspectFit];
    [logo setClipsToBounds:YES];
    [logo setImage:[UIImage imageNamed:@"engine"]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setAttributedText:mut];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    
    [self addSubview:label];
    [self addSubview:logo];
    
    NSDictionary *views = @{@"label":label, @"logo":logo};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[logo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[logo(150)]-20-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end