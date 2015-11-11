//
//  ViewController.m
//  04-键盘处理
//
//  Created by tom-pc on 15/11/11.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (nonatomic, weak) UIDatePicker *datePicker; // 日期选择
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 代码创建UIDatePicker
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    // 设置datePicker的本地话
    NSArray *idents = [NSLocale availableLocaleIdentifiers];
    NSLog(@"%@", idents); // 输出支持的语言
    // 设置datePicker的本地话为中国
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    // 设置datePicker的模式
    datePicker.datePickerMode = UIDatePickerModeDate; // 只显示日期，不显示时间
    
    // 设置textField的键盘
    self.birthdayField.inputView = datePicker;
    
    // 代码创建UIToolbar
    UIToolbar *toolbal = [[UIToolbar alloc] init];
    toolbal.bounds = CGRectMake(0, 0, 375, 44);
    toolbal.backgroundColor = [UIColor grayColor];
    // 创建上一个按钮
    UIBarButtonItem *previous = [[UIBarButtonItem alloc] initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 创建下一个按钮
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 创建弹簧
    UIBarButtonItem *bounceBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    // 完成按钮
    UIBarButtonItem *down = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(down)];
    // 将控件添加到toolbar
//    [toolbal setItems:<#(NSArray<UIBarButtonItem *> * _Nullable)#>];
    toolbal.items = @[previous, next, bounceBtn, down];
    // 设置inputAccessoryView在，就能在键盘上添加辅助view，
    self.birthdayField.inputAccessoryView = toolbal;
    
    self.datePicker = datePicker;
}

- (void)down{
    // 获取时间
    NSDate *selectedDate = self.datePicker.date;
    NSLog(@"%@", selectedDate);
    
    // 格式化输出日期(2014-08-25)
    // 格式化日期类
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    // 设置日期格式
    formater.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [formater stringFromDate:selectedDate];
    NSLog(@"%@", dateStr);
    
    // 设置textField的文本
    self.birthdayField.text = dateStr;
    
    // 隐藏键盘
    [self.birthdayField resignFirstResponder];
}
@end
