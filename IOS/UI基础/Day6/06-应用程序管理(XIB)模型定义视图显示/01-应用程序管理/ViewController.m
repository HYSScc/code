//
//  ViewController.m
//  01-应用程序管理
//
//  Created by tom-pc on 15/10/1.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "appView.h"
#define kAppViewW 65
#define kAppViewH 105
#define kColCount 3
#define kStartY 10

@interface ViewController () <AppViewDelegate>
@property (nonatomic, strong) NSArray *appList;
@property (nonatomic, strong) UILabel *tipLabel;
@end

@implementation ViewController

- (UILabel *)tipLabel
{
    if (_tipLabel == nil) {
        // 添加一个UILabel到界面上
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 520, 160, 40)];
        // 数值是0表示黑色，1表示纯白
        // alpha表示透明度
        _tipLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
        
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        
        // self.superview就是代码控制器中的self.view
        [self.view addSubview:_tipLabel];
        
        // 动画效果
        // 首尾式动画，修改对象的属性，frame，bounds，alpha
        // 初始透明度
        _tipLabel.alpha = 0.0; // 完全透明

    }
    return  _tipLabel;
}

- (NSArray *)appList
{
    if (_appList == nil) {
        
        // 将临时数组为属性赋值
        _appList = [AppInfo appList];
            
    }
    return _appList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
      
    
    // 搭建界面，九宫格
    // 6    4.7寸  375*667 @2x 750*1344

    
    // 375 - 3 * 80 = 135 / 4 = 33.75
    CGFloat marginX = (self.view.bounds.size.width - kColCount * kAppViewW) / (kColCount + 1);
    CGFloat marginY = 20;
    
    for (int i = 0; i < self.appList.count; i++) {
        
        // 行
        // 0, 1, 2 => 0
        // 3, 4, 5 => 1
        int row = i / kColCount;
        
        // 列
        // 0, 3, 6 => 0
        int col = i % kColCount;
        
        CGFloat x = marginX + col * (marginX + kAppViewW);
        CGFloat y = kStartY + marginY + row * (marginY + kAppViewH);
        
//        // 从XIB来加载自定义视图
//        appView *appView = [[[NSBundle mainBundle] loadNibNamed:@"appView" owner:nil options:nil] lastObject];
//        appView *appViewa = [appView app];
        appView *appViewa = [appView appViewWithAppInfo:self.appList[i]];
        
        // 设置代理
        appViewa.delegate = self;
        
        // 设置视图位置
        appViewa.frame = CGRectMake(x, y, kAppViewW, kAppViewH);
        
//        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, kAppViewW, kAppViewH)];
        //appView.backgroundColor = [UIColor redColor];
        [self.view addSubview:appViewa];
        
        
    }
    
}
#pragma mark - 自定义appView的代理方法
- (void)appViewDidClickDownloadButton:(appView *)appView
{
    self.tipLabel.text = appView.appInfo.name;
    
    // 动画结束之后删除
    // ^表示block，块代码，是一个预先准备好的代码块,可以当做参数传递，在需要的时候执行
    [UIView animateWithDuration:2.0f animations:^{
        NSLog(@"动画开始");
        self.tipLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            self.tipLabel.alpha = 0.0;
        
        }];
    }];

}

@end
