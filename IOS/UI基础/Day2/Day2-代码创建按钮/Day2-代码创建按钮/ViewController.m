//
//  ViewController.m
//  Day2-代码创建按钮
//
//  Created by tom-pc on 15/9/29.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

// 加载完成被调用(重写父类的viewDidLoad方法)
- (void)viewDidLoad {
    
    // 千万不要忘记调用父类的实现方法
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 使用alloc init方法实例化的按钮，就是custom类型的，按钮的类型一旦指定不能修改
    // 如果创建其他类型的按钮
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn1.center = CGPointMake(40, 40);
    [self.view addSubview:btn1]; // 将按钮添加到视图
    
    // 用代码创建按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(110, 100, 100, 100)]; // 创建按钮对象，初始化位置.(实例化对象)
    self.iconButton = btn; // 将成员变量指向btn的内存空间
    
    btn.backgroundColor = [UIColor redColor];
    
    
    // 设置背景图片(按钮能显示图片和文字，而且是有状态的)
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];
    
    // 设置按钮文字(也具有状态)
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setTitle:@"摸我" forState:UIControlStateHighlighted];
    
    // 设置按钮文字的颜色(也具有状态)
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    // 调整按钮中的文字垂直对齐(没有状态，可以用点语法)
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    
    // 将按钮添加到视图
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
