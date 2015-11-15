//
//  ViewController.m
//  作业-键盘处理
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "KeyboardTool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
// 输入框容器
@property (weak, nonatomic) IBOutlet UIView *inputContainer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 1.初始化自定义键盘
    [self setupCustomKeyboard];
    
    // 2.设置每一个textField的inputAccessoryView(键盘工具条)
    [self setupKeyboardTool];
}
// 1.初始化自定义键盘
- (void)setupCustomKeyboard{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    self.birthdayField.inputView = datePicker;
    
}
// 2.设置每一个textField的inputAccessoryView(键盘工具条)
- (void)setupKeyboardTool
{
    // 创建工具栏
    KeyboardTool *tool = [KeyboardTool keyboardTool];
    
    // 1.获取输入框窗口所有子控件
    NSArray *views = self.inputContainer.subviews;
    
    // 2.遍历
    for (UIView *child in views) {
        // 如果子控件是UITextField的时候，设置inputAccessoryView
        if ([child isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)child;
            tf.inputAccessoryView = tool;
        }
    }
}

// 点击空白部分隐藏键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
