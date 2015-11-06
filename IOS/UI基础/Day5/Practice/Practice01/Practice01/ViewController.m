//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/5.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
    textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:textField];
    
}

- (void)click
{
    NSLog(@"%s", __func__);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@  %@", NSStringFromRange(range), string); // 结构体的输出：nsstringFromRange()
    
    NSInteger loc = range.location;
    return (loc < 6);
}

@end
