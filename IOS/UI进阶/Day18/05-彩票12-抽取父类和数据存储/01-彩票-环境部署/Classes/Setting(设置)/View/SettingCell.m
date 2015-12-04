//
//  SettingCell.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "SettingCell.h"

#import "SettingItem.h"

#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"

#import "SettingLabelItem.h"

@interface SettingCell()

@property (nonatomic, strong) UISwitch *switchView; // 一个cell只需要一个Switch
@property (nonatomic, strong) UIImageView *imgView; // 一个cell只需要一个Arrow
@property (nonatomic, strong) UILabel *labelView;

@end

@implementation SettingCell

#warning 防止重复创建cell右边视图 而定义的懒加载
// 懒加载imageView
- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _imgView;
}

// 懒加载Switch
- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 100, 44);
        _labelView.textColor = [UIColor redColor];
        _labelView.textAlignment = NSTextAlignmentRight; // 右对齐
    }
    return _labelView;
}

#warning Item模型的setter方法实现
// 实现setter方法
- (void)setItem:(SettingItem *)item
{
    _item = item;
    
    // 1.设置cell子控件的数据
    [self setUpData];
    
    NSLog(@"%@", item); // 打印传人模型数据中cell的真实类
    
    // 2.设置右边视图
    [self setUpAccessoryView];
    
}
// 设置cell子控件的数据
- (void)setUpData
{
    if (_item.icon.length) {
        self.imageView.image = [UIImage imageNamed:_item.icon];
    }
    
    self.textLabel.text = _item.title;
    
}
// 设置右边视图
- (void)setUpAccessoryView
{
    if ([_item isKindOfClass:[SettingArrowItem class]]) { // 箭头
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 系统自带的箭头
        self.accessoryView = self.imgView;
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault; // 默认选中(重用单元格情况下一定要设置)
    }else if([_item isKindOfClass:[SettingSwitchItem class]]){ // Switch
//        self.accessoryView = [[UISwitch alloc] init];
        self.accessoryView = self.switchView; // getter方法获取Switch，不能用下划线_switchView
    
        self.selectionStyle = UITableViewCellSelectionStyleNone; // 取消选中效果
    }else if ([_item isKindOfClass:[SettingLabelItem class]]){ // label 时间
        self.accessoryView = self.labelView;
        
        SettingLabelItem *labelItem = (SettingLabelItem *)_item;
        self.labelView.text = labelItem.text;
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else{
        self.accessoryView = nil; // 什么都没有的cell
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

#warning cell的创建
// cell的创建
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
