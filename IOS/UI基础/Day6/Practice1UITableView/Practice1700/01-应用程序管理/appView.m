//
//  appView.m
//  01-应用程序管理
//
//  Created by tom-pc on 15/10/2.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "appView.h"
#import "AppInfo.h"
@interface appView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
@implementation appView

+ (instancetype)app
{
    return [[[NSBundle mainBundle] loadNibNamed:@"appView" owner:nil options:nil] lastObject];
}

+ (instancetype)appViewWithAppInfo:(AppInfo *)appInfo
{
    // 1. 实例化一个视图
    appView *view = [self app];
    
    // 2. 设置视图显示
    view.appInfo = appInfo;
    
    // 3. 返回视图
    return view;
}


/**
 利用setter方法设置视图的界面显示
 */
- (void)setAppInfo:(AppInfo *)appInfo
{
    _appInfo = appInfo;
    
    self.label.text = appInfo.name;
    self.iconView.image = appInfo.image;
}

/** 按钮监听方法 */
- (IBAction)click:(UIButton *)button
{
//    NSLog(@"%s %ld", __func__, button.tag);
    
    // 取出appInfo
//    AppInfo *appInfo = self.appList[button.tag];
    
    // 添加一个UILabel到界面上
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 520, 160, 40)];
    // 数值是0表示黑色，1表示纯白
    // alpha表示透明度
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    
    label.text = self.appInfo.name;
    label.textAlignment = NSTextAlignmentCenter;
    
    // self.superview就是代码控制器中的self.view
    [self.superview addSubview:label];
    
    // 动画效果
    // 首尾式动画，修改对象的属性，frame，bounds，alpha
    // 初始透明度
    label.alpha = 0.0; // 完全透明
    
    // 禁用按钮
    button.enabled = NO;
    
    // 动画结束之后删除
    // ^表示block，块代码，是一个预先准备好的代码块,可以当做参数传递，在需要的时候执行
    [UIView animateWithDuration:2.0f animations:^{
        NSLog(@"动画开始");
        label.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            NSLog(@"动画结束");
            //            button.enabled = NO;
            [label removeFromSuperview];
        }];
    }];
}


@end
