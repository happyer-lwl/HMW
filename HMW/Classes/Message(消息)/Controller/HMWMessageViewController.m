//
//  HMWMessageViewController.m
//  HMW
//
//  Created by 刘伟龙 on 15/10/18.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "HMWMessageViewController.h"

@interface HMWMessageViewController ()

@end

@implementation HMWMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // style 设置背景方式
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:self action:@selector(compose)];
    
    // 禁用按键点击
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)compose{
    
}

- (void)viewWillAppear:(BOOL)animated{
//    // 禁用按键点击
//    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 修改Cell的文字内容
    cell.textLabel.text = [NSString stringWithFormat:@"Test-Message-%ld", (long)indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageTestViewController* msgTestVC = [[MessageTestViewController alloc] init];
    
    // 当消息测试控制器被push时，消息测试空控制器所在的tabbarcontroller的tabbar会自动隐藏
    // 当消息测试控制器被pop时，消息测试空控制器所在的tabbarcontroller的tabbar会自动显示
    //msgTestVC.hidesBottomBarWhenPushed = YES;  // Navigation创建控制器时已经做了此步
    
    msgTestVC.title = @"消息测试控制器";
    [self.navigationController pushViewController:msgTestVC animated:YES];
}
@end
