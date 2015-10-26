//
//  appView.h
//  01-应用程序管理
//
//  Created by tom-pc on 15/10/2.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppInfo, appView;

// 1.协议名以类名开始+Delega
@protocol AppViewDelegate <NSObject>
// 2.协议方法，以类名开始（没有类前缀），第一个参数是自己
// 只是定义方法名，不做具体实现
- (void)appViewDidClickDownloadButton:(appView *)appView;

@end

@interface appView : UIView

// 3.定义代理属性.遵守了这个协议的任意一个对象，都可以成为代理
@property (nonatomic, weak) id<AppViewDelegate> delegate;



//@property (weak, nonatomic) IBOutlet UIButton *button;

// 类方法，方便调用视图
+ (instancetype)app;
// 实例化视图，并使用appInfo设置视图显示
+ (instancetype)appViewWithAppInfo:(AppInfo *)appInfo;

// 自定义视图中显示的数据来源是数据模型
// 使用模型设置自定义视图的显示
@property (nonatomic, strong) AppInfo *appInfo;

@end
