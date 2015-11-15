//
//  ContactCell.m
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ContactCell.h"
#import "Contact.h"

@interface ContactCell()
@property (nonatomic, weak) UIView *divide;
@end

@implementation ContactCell

- (void)setContact:(Contact *)contact
{
    _contact = contact;
    
    // 给cell 里面的控件赋值
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"contact";
    return [tableView dequeueReusableCellWithIdentifier:ID];
}
// 懒加载分割线
- (UIView *)divide
{
    if (_divide == nil) {
        UIView *v = [[UIView alloc] init]; // 强引用
        v.backgroundColor = [UIColor blackColor];
        v.alpha = 0.2;
        _divide = v;
        
        [self.contentView addSubview:_divide]; // 子控件最好添加到contentView
    }
    return _divide;
}

// 当自己的frame改变时，调用
// 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 给divide设置位置
    CGFloat divideH = 1;
    CGFloat divideW = self.bounds.size.width;
    CGFloat divideY = self.bounds.size.height - divideH;
    self.divide.frame = CGRectMake(0, divideY, divideW, divideH);
}
@end
