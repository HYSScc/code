//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num1;
@property (weak, nonatomic) IBOutlet UITextField *num2;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)compute:(id)sender {
    NSLog(@"%s", __func__);
    // 1.取得界面上的两个文本框
    NSString *n1 = self.num1.text;
    NSString *n2 = self.num2.text;
    
    // 2.将内容转成int
    int result = n1.intValue + n2.intValue;
    
    // 3.显示结果
    self.label.text = [NSString stringWithFormat:@"%d", result];
    
    // 参数表示是否强行关闭键盘
    [self.view endEditing:YES];
}
@end
