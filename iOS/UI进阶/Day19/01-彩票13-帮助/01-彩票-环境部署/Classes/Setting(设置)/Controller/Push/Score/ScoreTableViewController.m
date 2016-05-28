//
//  ScoreTableViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ScoreTableViewController.h"

#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"
#import "SettingLabelItem.h"

#import "SettingGroup.h"

#import "SaveTool.h"

@interface ScoreTableViewController ()

@property (nonatomic, strong) SettingLabelItem *start; // 模型

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ScoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 第0组
    [self addGroup0];
    // 第1组
    [self addGroup1];
    
    [self addGroup2];
}

- (void)addGroup0
{
    SettingSwitchItem *t = [SettingSwitchItem settingItemWithIcon:nil title:@"提醒我关注的比赛"]; // 多态
    
    SettingGroup *group0 = [[SettingGroup alloc] init];
    
    group0.footer = @"当我关注的比赛比分发生变化的时候，通过小弹窗或推送进行提醒";
    
    group0.items = @[t];
    
    [self.dataList addObject:group0];
}

- (void)addGroup1
{
    SettingLabelItem *start = [SettingLabelItem settingItemWithIcon:nil title:@"开始时间"];
    
    _start = start;
    
    // 取出存储的数据
//    start.text = [[NSUserDefaults standardUserDefaults] objectForKey:start.title];
    // 调用Tool实现数据取出
//    start.text = [SaveTool objectForKey:start.title];
    
    if (start.text.length == 0) {
        start.text = @"00:00";
    }
    
    start.option = ^{
        
        UITextField *textField = [[UITextField alloc] init]; // 局部变量
        
        _textField = textField;
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeTime; // 时间类型
        datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"]; // 英文->中文
        
        // 创建日期格式对象
        NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
        dateF.dateFormat = @"HH:mm";
        // 设置时间
        datePicker.date = [dateF dateFromString:@"00:00"];
        // 监听UIDatePicker
        [datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        // 设置键盘
        textField.inputView = datePicker;
        
        [textField becomeFirstResponder];
        
        [self.view addSubview:textField];
    };
    
    SettingGroup *group1 = [[SettingGroup alloc] init];
    
    group1.header = @"只在以下时间接受比分直播";
    
    group1.items = @[start];
    
    [self.dataList addObject:group1];
}
// 监听方法
- (void)valueChange:(UIDatePicker *)datePicker
{
    NSLog(@"%@", datePicker.date); // 可以拿到date属性
    
    // 创建日期格式对象
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    dateF.dateFormat = @"HH:mm";
    
    _start.text = [dateF stringFromDate:datePicker.date]; // 改变label的text
    
//    // 存储数据
//    [[NSUserDefaults standardUserDefaults] setObject:_start.text forKey:_start.title];
//    // 同步
//    [[NSUserDefaults standardUserDefaults] synchronize];
    // 调用Tool实现数据存储和同步
//    [SaveTool setObject:_start.text forKey:_start.title]; // 封装到模型的setter方法中
    
    [self.tableView reloadData]; // 刷新数据
}


- (void)addGroup2
{
    SettingLabelItem *k = [SettingLabelItem settingItemWithIcon:nil title:@"结束时间"];
    
    k.text = @"00:00";
    
    SettingGroup *group2 = [[SettingGroup alloc] init];
    
    group2.items = @[k];
    
    [self.dataList addObject:group2];
    
}


@end
