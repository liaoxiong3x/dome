//
//  DCViewController.m
//  父子控制器
//
//  Created by 戴川 on 16/6/3.
//  Copyright © 2016年 戴川. All rights reserved.
//


#define DCScreenW    [UIScreen mainScreen].bounds.size.width
#define DCScreenH    [UIScreen mainScreen].bounds.size.height


#import "DCViewController.h"
#import "DCNavTabBarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
@implementation DCViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    OneViewController *one = [[OneViewController alloc]init];
    one.title = @"one";
    TwoViewController *two = [[TwoViewController alloc]init];
    two.title = @"two";
    ThreeViewController *three = [[ThreeViewController alloc]init];
    three.title = @"three";
    FourViewController *four = [[FourViewController alloc]init];
    four.title = @"four";
    FiveViewController *five = [[FiveViewController alloc]init];
    five.title = @"five";
    SixViewController *six = [[SixViewController alloc]init];
    six.title = @"six";
    
    NSArray *subViewControllers = @[one,two,three,four,five,six];
    DCNavTabBarController *tabBarVC = [[DCNavTabBarController alloc]initWithSubViewControllers:subViewControllers];
    tabBarVC.view.frame = CGRectMake(0, 64, DCScreenW, DCScreenH - 64);

    [self.view addSubview:tabBarVC.view];
    [self addChildViewController:tabBarVC];
    
    self.title = @"总控制器";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
