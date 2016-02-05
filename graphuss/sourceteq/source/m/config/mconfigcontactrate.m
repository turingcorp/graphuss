#import "mconfigcontactrate.h"

@implementation mconfigcontactrate

#pragma mark -
#pragma mark contact protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_contact_rate_title", nil);
    
    return title;
}

-(void)selected:(vconfigcontact*)view
{
    [[analytics singleton] trackevent:ga_event_config_contact_rate action:ga_action_start label:nil];
}

@end