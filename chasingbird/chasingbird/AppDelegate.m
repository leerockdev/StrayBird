//
//  AppDelegate.m
//  chasingbird
//
//  Created by Howard on 2015-08-08.
//  Copyright © 2015 howalee. All rights reserved.
//

#import "AppDelegate.h"
#import "CHBDemoViewController.h"
#import "CHBHomeViewController.h"
#import "CHBGameViewController.h"
#import "CHBTypes.h"
@import HealthKit;

@interface AppDelegate ()
@property (nonatomic, retain) UINavigationController *navController;
@end

@implementation AppDelegate

#pragma mark - actions

- (void)backToHome {
    [self.navController popToRootViewControllerAnimated:NO];
}

#pragma mark - delgate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //CHBDemoViewController *vc = [CHBDemoViewController new];
    CHBHomeViewController *vc = [CHBHomeViewController new];
    //CHBGameViewController *vc = [CHBGameViewController new];
    self.navController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    
    [self.navController setNavigationBarHidden:YES animated:NO];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToHome) name:homeNotification object:nil];
    
    /*
    [navController.navigationBar setBackgroundImage:[UIImage new]
                        forBarMetrics:UIBarMetricsDefault];
    navController.navigationBar.shadowImage = [UIImage new];
    navController.navigationBar.tintColor = [UIColor blackColor];
    */
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationShouldRequestHealthAuthorization:(UIApplication *)application {
    HKHealthStore *healthStore = [HKHealthStore new];
    [healthStore handleAuthorizationForExtensionWithCompletion:^(BOOL success, NSError * _Nullable error) {
        
    }];
}

@end
