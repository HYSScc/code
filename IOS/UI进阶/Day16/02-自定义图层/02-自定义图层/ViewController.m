//
//  ViewController.m
//  02-自定义图层
//
//  Created by tom-pc on 15/11/25.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个图层
    CALayer *layer = [CALayer layer];
    // 设置尺寸
    layer.bounds =CGRectMake(0, 0, 100, 100);
    // 设置位置
    layer.position = CGPointMake(100, 100);
    // 设置颜色
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    // 设置内容
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"阿狸头像"].CGImage); // 首先要传一个CGImage；然后自己添加一个id类型，或者等错误提示出现直接回车；
    
    // 添加成控制器view上的一个子的图层
    [self.view.layer addSublayer:layer];
}

@end
