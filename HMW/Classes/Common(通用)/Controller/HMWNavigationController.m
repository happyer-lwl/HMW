//
//  HMWNavigationController.m
//  HMW
//
//  Created by 刘伟龙 on 15/10/19.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "HMWNavigationController.h"

@implementation HMWNavigationController

+ (void) initialize{
    //设置整个项目所有Item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key: NS*****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];  // 颜色
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];      // 字体
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.5];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    HMWLog(@"%@", self.navigationController);
    
    if(self.viewControllers.count > 0){ // 这里不是根控制器，如果有特殊需求的话，只要在自己的类中单独定义即可
        // 设置tabbarController自动隐藏和显示
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithAction:@selector(back) target:self image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithAction:@selector(more) target:self image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }
    
    [super pushViewController:viewController animated:YES];
}

-(void)back{
#warning 这里不是self.navigationController，是self
    // self本身就是一个导航控制器，self.navigationController 是空的
    [self popViewControllerAnimated:YES];
}

-(void)more{
    [self popToRootViewControllerAnimated:YES];
}
@end
