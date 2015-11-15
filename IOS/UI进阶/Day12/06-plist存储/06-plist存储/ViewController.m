//
//  ViewController.m
//  06-plist存储
//
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// 点击读取的时候调用
- (IBAction)read:(id)sender {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]; //只有一个Documents iOS中
    
    // 拼接文件路径
    NSString *filePath = [path stringByAppendingPathComponent:@"data.plist"];
    
    NSArray *data = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@", data);
}

// 点击保存的时候调用
- (IBAction)save:(id)sender {
    
    // 获取沙盒的根路径
    NSString *home = NSHomeDirectory();
//    NSLog(@"%@", NSHomeDirectory());
    
    // 拼接Document路径
//    NSString *path = [home stringByAppendingString:@"/Document"];
//    NSString *path = [home stringByAppendingPathComponent:@"Documents"]; // 自动拼接一个斜杠
//    NSLog(@"%@", path);
    
    // 获取Documents根路径
    // NSDocumentDirectory：查找Documents文件夹
    // NSUserDomainMask：在用户的应用程序下查找
    // YES 把路径展开 NO 当前应用的根路径 == ~
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    // 拼接文件路径
    NSString *filePath = [path stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"%@", filePath);
    
    // 只有具备writeToFile:的对象才能使用plist存储，NSArray
    NSArray *array = @[@1, @2, @"123"];
    
    [array writeToFile:filePath atomically:YES];
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
