//
//  ViewController.m
//  练习1
//
//  Created by tom-pc on 15/10/2.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // XIB测试代码
    // 加载XIB
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:nil options:nil];
    //    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"appView" owner:nil options:nil] lastObject];
    //    UIView *view = [array firstObject];
    NSLog(@"%@", array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
