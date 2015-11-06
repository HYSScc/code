//
//  appView.h
//  01-应用程序管理
//
//  Created by tom-pc on 15/10/2.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppInfo;

@interface appView : UIView
//@property (weak, nonatomic) IBOutlet UIButton *button;

// 类方法，方便调用视图
+ (instancetype)app;
// 实例化视图，并使用appInfo设置视图显示
+ (instancetype)appViewWithAppInfo:(AppInfo *)appInfo;

// 自定义视图中显示的数据来源是数据模型
// 使用模型设置自定义视图的显示
@property (nonatomic, strong) AppInfo *appInfo;

@end
