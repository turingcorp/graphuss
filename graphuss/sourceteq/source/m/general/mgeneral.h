#import <Foundation/Foundation.h>

// app

typedef NS_ENUM(NSInteger, app_page)
{
    app_page_config,
    app_page_list,
    app_page_camera,
};

// analytics

typedef NS_ENUM(NSInteger, ga_screen)
{
    ga_screen_login
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_login
};

typedef NS_ENUM(NSInteger, ga_action)
{
    ga_action_on,
    ga_action_off,
    ga_action_optin,
    ga_action_start,
    ga_action_cancelled,
    ga_action_error,
    ga_action_done,
    ga_action_changed,
    ga_action_stopped,
    ga_action_selected
};