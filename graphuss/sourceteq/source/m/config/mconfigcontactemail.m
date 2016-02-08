#import "mconfigcontactemail.h"

@implementation mconfigcontactemail

#pragma mark -
#pragma mark contact protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_contact_email_title", nil);
    
    return title;
}

-(void)selected:(vconfigcontact*)view
{
    [[analytics singleton] trackevent:ga_event_config_contact_email action:ga_action_start label:nil];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:imateq@iturbi.de"]];
}

@end