//
//  TMAppDelegate.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMCategoryViewController;
@class TMLandingViewController;

@interface TMAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) TMCategoryViewController *categoryViewController;

@property (strong, nonatomic) TMLandingViewController *landingViewController;

@end
