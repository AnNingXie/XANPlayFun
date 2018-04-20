//
//  AppDelegate.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "AppDelegate.h"
#import "XANTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    XANTabBarController *root=[[XANTabBarController alloc]init];
    self.window.rootViewController=root;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

@end
