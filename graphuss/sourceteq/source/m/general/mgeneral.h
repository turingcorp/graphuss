#import <Foundation/Foundation.h>

// app

typedef NS_ENUM(NSInteger, app_page)
{
    app_page_config,
    app_page_list,
    app_page_camera,
};

// camera

typedef NS_ENUM(NSInteger, cam_flash)
{
    cam_flash_off,
    cam_flash_auto,
    cam_flash_on,
    cam_flash_torch
};

// analytics

typedef NS_ENUM(NSInteger, ga_screen)
{
    ga_screen_pic_list,
    ga_screen_pic_detail,
    ga_screen_camera,
    ga_screen_config,
    ga_screen_config_library,
    ga_screen_config_library_delete,
    ga_screen_config_about,
    ga_screen_config_contact,
    ga_screen_rate
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_shoot,
    ga_event_cam_focus,
    ga_event_cam_exposure,
    ga_event_cam_flash,
    ga_event_pic_file_duplicate,
    ga_event_pic_file_share,
    ga_event_pic_file_compress,
    ga_event_pic_file_delete,
    ga_event_pic_edit_rotate,
    ga_event_pic_edit_scale,
    ga_event_pic_filter_light,
    ga_event_pic_filter_blackandwhite,
    ga_event_pic_filter_color,
    ga_event_config_contact_message,
    ga_event_config_contact_email,
    ga_event_config_contact_rate,
    ga_event_rate,
    ga_event_rate_review
};

typedef NS_ENUM(NSInteger, ga_action)
{
    ga_action_error,
    ga_action_start,
    ga_action_restart,
    ga_action_shoot,
    ga_action_completed,
    ga_action_cancel,
    ga_action_left,
    ga_action_right,
    ga_action_automatic,
    ga_action_manual,
    ga_action_off,
    ga_action_on,
    ga_action_torch,
    ga_action_content
};