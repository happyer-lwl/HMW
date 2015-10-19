//
//  AppDelegate.m
//  HMW
//
//  Created by 刘伟龙 on 15/10/18.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "AppDelegate.h"
#import "HMWHomeViewController.h"
#import "HMWMessageViewController.h"
#import "HMWDiscoverViewController.h"
#import "HMWProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    // 创建根控制器
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    self.window.rootViewController = tabbar;

    // 创建子控制器
    HMWHomeViewController *homeVC = [[HMWHomeViewController alloc] init];
    [self addChildVC: homeVC title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    HMWMessageViewController *messageVC= [[HMWMessageViewController alloc] init];
    [self addChildVC: messageVC title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    HMWDiscoverViewController *discoverVC = [[HMWDiscoverViewController alloc] init];
    [self addChildVC: discoverVC title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];

    HMWProfileViewController *profileVC = [[HMWProfileViewController alloc] init];
    [self addChildVC: profileVC title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    tabbar.viewControllers = @[homeVC, messageVC, discoverVC, profileVC];
    
    // 将重复代码抽取成函数方法
    // 1 将相同代码抽取成方法
    // 2 将不同代码做成参数
    // 3 调用方法，加入参数
    
    // 显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)addChildVC:(UIViewController*)childVC title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage
{
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed: image];
    UIImage *messageSelectedImage = [UIImage imageNamed:selectedImage];
    // 声明： 图片在以后使用时按照原始模式显示
    childVC.tabBarItem.selectedImage = [messageSelectedImage imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    
    // 修改tabbar_item的文字相关内容
    NSMutableDictionary *textAttri = [NSMutableDictionary dictionary];
    textAttri[NSForegroundColorAttributeName] = HMWColor(123,123,123);
    NSMutableDictionary *textSelectedAttri = [NSMutableDictionary dictionary];
    textSelectedAttri[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [childVC.tabBarItem setTitleTextAttributes:textAttri forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:textSelectedAttri forState:UIControlStateSelected];
    childVC.view.backgroundColor = RANDOM_COLOR;
    
    return childVC;
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

@end
