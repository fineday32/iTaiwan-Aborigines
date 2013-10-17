//
//  iTaiwan_AboriginesAppDelegate.h
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/15.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "mainViewController.h"

@class iTaiwan_AboriginesViewController;

@interface iTaiwan_AboriginesAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) iTaiwan_AboriginesViewController *viewController;
@property (strong, nonatomic) FBSession *session;


@end
