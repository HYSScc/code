//
//  AppView.m
//  Practice01
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "AppView.h"
#import "App.h"

@implementation AppView

- (void)setAppModel:(App *)appModel
{
    _appModel = appModel;
    
    self.label.text = appModel.name;
    self.iconView.image = [UIImage imageNamed:appModel.icon];
}

+ (instancetype)app
{
    return [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] lastObject];
}

+ (instancetype)appViewWithAppModel:(App *)appModel
{
    // 1.实例化一个视图
    AppView *view = [self app];
    
    // 2.设置视图显示
    view.appModel = appModel;
    
    // 返回视图
    return view;
}

- (IBAction)click:(UIButton *)button {
    NSLog(@"%s %ld", __func__, button.tag);
    // 添加一个label到界面上
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(45, 600, 285, 44)];
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    
    // 设置内容
//    App *model = self.appList[button.tag];
    label.text = self.appModel.name;
    label.textAlignment = NSTextAlignmentCenter;
    [self.superview addSubview:label];
    
    // 动画准备工作
    label.alpha = 0.0; // 关键一步，开始把label设置为透明
    button.enabled = NO;
    
    // 动画
    // 开始动画
    [UIView animateWithDuration:2.0f animations:^{
        NSLog(@"动画开始");
        label.alpha = 1.0;
    } completion:^(BOOL finished) {
        // 设置隐藏动画
        [UIView animateWithDuration:2.0 animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];

    
}
@end
