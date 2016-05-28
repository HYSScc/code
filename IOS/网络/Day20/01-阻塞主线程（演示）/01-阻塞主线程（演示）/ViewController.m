//
//  ViewController.m
//  01-阻塞主线程（演示）
//
//  Created by tom-pc on 15/12/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (int i = 0; i < 10000; i++) {
        NSLog(@"--------------");
    }
    NSLog(@"%@", [NSThread currentThread]); // 判断线程在哪条
}

@end
