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
    [[analytics singleton] trackevent:<#(ga_event)#> action:<#(ga_action)#> label:<#(NSString *)#>];
}

@end