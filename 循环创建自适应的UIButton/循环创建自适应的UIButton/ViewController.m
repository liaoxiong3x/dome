//
//  ViewController.m
//  循环创建自适应的UIButton
//
//  Created by XiaoGe on 16/6/12.
//  Copyright © 2016年 梁晓. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[@"无知",@"风云变幻",@"施耐庵",@"唉",@"西门吹雪",@"呵呵哒",@"快看看",@"窿窿啦啦",@"一杆禽兽狙",@"合欢花",@"暴走大事件",@"非诚勿扰",@"呵呵呵",@"无知",@"风云变幻",@"施耐庵",@"唉",@"西门吹雪",@"呵呵哒",@"快看看",@"窿窿啦fcgdfgdf啦",@"一杆禽兽狙",@"合欢花",@"暴走大事件",@"非诚勿扰",@"呵呵呵",@"无知",@"风云变幻",@"施耐庵",@"唉",@"西门吹雪",@"呵呵哒",@"快看看",@"窿窿啦啦",@"一杆禽兽狙",@"合欢花",@"暴走大事件",@"非诚勿扰",@"呵呵呵"];
    //获得屏幕的尺寸
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 200;//用来控制button距离父视图的高
    for (int i = 0; i < arr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 100 + i;
        button.backgroundColor = [UIColor greenColor];
        [button addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        //设置按钮圆角半径
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        //设置按钮边框宽度和颜色
        button.layer.borderWidth = 1;
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,0,0,1});
        [button.layer setBorderColor:color];
        //根据计算文字的大小
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};
        CGFloat length = [arr[i] boundingRectWithSize:CGSizeMake(screenW, screenH) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        //设置文字居中显示
        button.titleLabel.textAlignment = 1;
        //为button赋值
        [button setTitle:arr[i] forState:UIControlStateNormal];
        //设置button的frame
        button.frame = CGRectMake(10 + w, h, length + 15 , 30);
        //当button的位置超出屏幕边缘时换行  只是button所在父视图的宽度
        if(10 + w + length + 15 > screenW){
            w = 0; //换行时将w置为0
            h = h + button.frame.size.height + 10;//距离父视图也变化
            button.frame = CGRectMake(10 + w, h, length + 15, 30);//重设button的frame
        }
        w = button.frame.size.width + button.frame.origin.x;
        [self.view addSubview:button];
    }
}
//点击事件
- (void)handleClick:(UIButton *)btn{
    NSLog(@"%ld",btn.tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
