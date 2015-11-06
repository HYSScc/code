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

    // 问题分析：
    // 1.点击自定义视图时，创建了一个Label，Label添加到了superView，不合理
    // 2.“越权”，添加Label的工作交给视图控制器会更合理
    // 解决方法
    // 按钮被点击时，通知视图控制器 -> 视图控制器监听按钮的点击 -> 视图控制器是自定义视图的代理
    
    // 通知代理
    // 1> 判断代理是否实现了协议方法
    if ([self.delegate respondsToSelector:@selector(appViewDidClickDownloadButton:)]) {
        // 如果实现了，再通知代理去工作
        [self.delegate appViewDidClickDownloadButton:self];
    }
    
    
    // 禁用按钮
    button.enabled = NO;
    
}


@end
