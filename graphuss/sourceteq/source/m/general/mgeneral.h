#import <Foundation/Foundation.h>

// app

typedef NS_ENUM(NSInteger, appsection)
{
    appsectionlogin,
    appsectionconfig,
    appsectionbrowse,
    appsectioncontact
};

// analytics

typedef NS_ENUM(NSInteger, ga_screen)
{
    ga_screen_login,
    ga_screen_logout,
    ga_screen_delete,
    ga_screen_browse,
    ga_screen_config,
    ga_screen_config_settings,
    ga_screen_profile,
    ga_screen_profile_age,
    ga_screen_profile_name,
    ga_screen_contact,
    ga_screen_gattaca_main,
    ga_screen_gattaca_test,
    ga_screen_gattaca_congrats
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_login,
    ga_event_logout,
    ga_event_delete,
    ga_event_apprate,
    ga_event_config_noti,
    ga_event_facebook_profile,
    ga_event_profile_age,
    ga_event_profile_name,
    ga_event_gattaca_test
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

// profile

typedef NS_ENUM(NSInteger, profile_gender)
{
    profile_gender_male,
    profile_gender_female
};

typedef NS_ENUM(NSInteger, profile_name)
{
    profile_name_firstname,
    profile_name_middlename,
    profile_name_lastname
};

typedef NS_ENUM(NSInteger, profile_circle)
{
    profile_circle_math,
    profile_circle_music,
    profile_circle_politics,
    profile_circle_leisure
};