//
//  HeaderView.m
//  03-QQ好友列表
//
//  Created by tom-pc on 15/11/8.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "HeaderView.h"
#import "FriendGroup.h"

@interface HeaderView ()
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, weak) UILabel *label;
@end

@implementation HeaderView
+ (instancetype)headerViewWith:(UITableView *)tableView
{
    NSString *ID = @"Cell";
    // 缓冲池中查找是否存在headerView，如果存在，直接取出
    HeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        // 如果不存在，重新创建
        header = [[HeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}
// 前面做了init操作，这里要重写init方法
// 当headerView上的子控件只需做一次操作 或者 要显示出来的 就写在以下方法种
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //UIButtonTypeCustom -> [[UIButton alloc] init];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = self.bounds;
//        [btn setBackgroundColor:[UIColor blackColor]];
        
        // 设置内容属性
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; // 按钮内容居左
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0); // 按钮的内边距
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0); // 按钮label的内边距
        [btn addTarget:self action:@selector(nameBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        // 添加
        self.button = btn;
        
        NSLog(@"----%@", NSStringFromCGRect(self.frame));
        
        UILabel *label = [[UILabel alloc] init];
//        label.frame = CGRectMake(375-150, 0, 150, 44);
//        label.backgroundColor = [UIColor redColor];
        
        // 设置内容属性
        label.textAlignment = NSTextAlignmentRight; // 按钮具右
        
        [self.contentView addSubview:label];
        // 添加
        self.label = label;
    }
    return self;
}

// 布局，父控件的frame改变的时候，就会重新布局里面的子控件
- (void)layoutSubviews
{
    self.button.frame = self.bounds; // 等于header的宽高
    CGFloat labelX = self.frame.size.width - 150 - 10; // 减label的宽度和padding
    CGFloat labelY = 0;
    CGFloat labelW = 150;
    CGFloat labelH = self.frame.size.height;
    self.label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}
// 模型set方法
- (void)setGroup:(FriendGroup *)group
{
    _group = group;
    
    // 设置btn的name
    [self.button setTitle:group.name forState:UIControlStateNormal];
    // 设置显示在线人数
    self.label.text = [NSString stringWithFormat:@"%d/%ld", group.online, group.friends.count];
}
// 监听方法
- (void)nameBtnClick:(UIButton *)btn
{
    NSLog(@"+++++++");
}
@end
