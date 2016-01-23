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
    ga_screen_pic_list,
    ga_screen_pic_detail,
    ga_screen_camera,
    ga_screen_config
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_shoot
};

typedef NS_ENUM(NSInteger, ga_action)
{
    ga_action_error,
    ga_action_start,
    ga_action_shoot,
    ga_action_completed
};