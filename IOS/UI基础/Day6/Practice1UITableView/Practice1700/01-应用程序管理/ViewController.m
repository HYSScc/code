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

@interface ViewController ()
@property (nonatomic, strong) NSArray *appList;
@end

@implementation ViewController

- (NSArray *)appList
{
    if (_appList == nil) {
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
        appView *appViewa = [appView appViewWithAppInfo:self.appList[i]];
        
        // 设置视图位置
        appViewa.frame = CGRectMake(x, y, kAppViewW, kAppViewH);
        
        [self.view addSubview:appViewa];
        
        }
}




@end
