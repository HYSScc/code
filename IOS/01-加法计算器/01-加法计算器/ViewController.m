//
//  ViewController.m
//  01-加法计算器
//
//  Created by tom-pc on 15/9/26.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
/*
IBAction本质就是void，只不过能够允许连线而已
*/

// 私有扩展，Xcode 4.6开始，苹果建议不开放的属性和方法定义在私有扩展中
// 可以保证.h中只定义对外开放的属性和方法
@interface ViewController ()

// 计算方法
//- (IBAction)compute; // 可以省略，连线已经不连接到私有扩展里面

// 声明两个文本框属性
@property (nonatomic, weak) IBOutlet UITextField *num1;
@property (nonatomic, weak) IBOutlet UITextField *num2;

@property (nonatomic, weak) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 计算方法的实现
- (IBAction)compute
{

    NSLog(@"compute");
    // 1.取得界面上“两个文本框”的内容
    NSString *n1 = self.num1.text;
    NSString *n2 = self.num2.text;
    
    NSLog(@"%@ - %@", n1, n2);
    
    // 2.将内容相加//转成int类型后相加
    int result = n1.intValue + n2.intValue;
    
    // 3.显示结果，显示在“右侧的标签”中
    self.resultLabel.text = [NSString stringWithFormat:@"%d", result];
    
    // 关闭键盘
    // 在所有的面向对象语言中，有一个原则:谁申请，谁释放
    // 对应键盘就应该，谁打开，谁关闭。
    // FirstResponder：光标所在的文本框
    // resign: 辞去
    
    //[self.num1 resignFirstResponder]; // 光标辞去时关闭键盘
    //[self.num2 resignFirstResponder];
    
    // 让视图关闭键盘，无论现在谁是第一响应者
    // 参数表示是否强行关闭键盘
    [self.view endEditing:YES];
    
}

@end
