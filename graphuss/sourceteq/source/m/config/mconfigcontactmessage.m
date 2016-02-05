#import "mconfigcontactmessage.h"

@implementation mconfigcontactmessage

#pragma mark -
#pragma mark contact protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_contact_message_title", nil);
    
    return title;
}

-(void)selected:(vconfigcontact*)view
{
    [[analytics singleton] trackevent:ga_event_config_contact_message action:ga_action_start label:nil];
    [view.fieldcontainer setHidden:NO];
    [view.field becomeFirstResponder];
}

@end