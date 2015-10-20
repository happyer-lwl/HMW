//
//  HWMainViewController.m
//  HMW
//
//  Created by 刘伟龙 on 15/10/19.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "HWMainViewController.h"
#import "HMWHomeViewController.h"
#import "HMWDiscoverViewController.h"
#import "HMWMessageViewController.h"
#import "HMWProfileViewController.h"
#import "HMWNavigationController.h"

@interface HWMainViewController ()

@end

@implementation HWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 创建子控制器
    HMWHomeViewController *homeVC = [[HMWHomeViewController alloc] init];
    [self addChildVC: homeVC title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];

    HMWMessageViewController *messageVC= [[HMWMessageViewController alloc] init];
    [self addChildVC: messageVC title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    HMWDiscoverViewController *discoverVC = [[HMWDiscoverViewController alloc] init];
    [self addChildVC: discoverVC title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    HMWProfileViewController *profileVC = [[HMWProfileViewController alloc] init];
    [self addChildVC: profileVC title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}

/**
 * 添加一个子控制器
 *
 *  @param childVC          子控制器
 *  @param title            标题
 *  @param image            图片
 *  @param selectedImage    选中图片
 */
- (void)addChildVC:(UIViewController*)childVC title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage
{
    // 设置子控制器的文字
    childVC.title = title;                        // 同时设置tabbar和navigation的title
    //childVC.tabBarItem.title = title;           // 设置tabbar的title
    //childVC.navigationItem.title = title;       // 设置导航栏的title

    // 设置子控制器的图片
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
    //childVC.view.backgroundColor = RANDOM_COLOR;
    
    // 外面传入一个子控制器，包装一个导航控制器
    UINavigationController *nav = [[HMWNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}
@end
