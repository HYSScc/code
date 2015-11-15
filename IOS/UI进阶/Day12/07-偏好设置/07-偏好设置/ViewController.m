//
//  ViewController.m
//  07-偏好设置
//  主要是用来存放一些基本的信息
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)save:(id)sender {
    // 获取沙盒的根路径
    NSString *home = NSHomeDirectory();
    NSLog(@"%@", home);
    
    // 1.不需要关心文件名
    // [NSUserDefaults standardUserDefaults]可以直接设置偏好设置文件夹
    // 偏好设置会自己存储一个plist文件
    // 内部封转了一个字典去存储，比字典好的就是不用获取路径和writeToFile
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 自动生成一个plist文件，存放在偏好设置的文件夹里面
    [defaults setObject:@"xxm" forKey:@"name"];
    
    // 前面生成的数据都是在内存中
    // 同步：把内存中的数据和硬盘（沙盒）同步
    [defaults synchronize]; // 对象方法
    
}
// 读取
- (IBAction)read:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@", [defaults objectForKey:@"name"]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
