//
//  ViewController.m
//  01-应用程序管理
//
//  Created by tom-pc on 15/10/1.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *appList;
@end

@implementation ViewController

- (NSArray *)appList
{
    if (_appList == nil) {
        
        // appList保存的是字典=>模型
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
//        _appList = [NSArray arrayWithContentsOfFile:path];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
        
        // 创建一个临时数组
        NSMutableArray *arrayM = [NSMutableArray array];
        // 遍历数组，依次转换模型
        for (NSDictionary *dict in array){
            AppInfo *appInfo = [[AppInfo alloc] init];
            appInfo.name = dict[@"name"];
            appInfo.icon = dict[@"icon"];
            
            [arrayM addObject:appInfo];
        }
        // 将临时数组为属性赋值
        _appList = arrayM;
            
    }
    return _appList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 搭建界面，九宫格
    // 6    4.7寸  375*667 @2x 750*1344
#define kAppViewW 65
#define kAppViewH 105
#define kColCount 3
#define kStartY 10
    
    // 375 - 3 * 80 = 135 / 4 = 33.75
    CGFloat marginX = (self.view.bounds.size.width - kColCount * kAppViewW) / (kColCount + 1);
    CGFloat marginY = 20;
    
    for (int i = 0; i < 12; i++) {
        
        // 行
        // 0, 1, 2 => 0
        // 3, 4, 5 => 1
        int row = i / kColCount;
        
        // 列
        // 0, 3, 6 => 0
        int col = i % kColCount;
        
        CGFloat x = marginX + col * (marginX + kAppViewW);
        CGFloat y = kStartY + marginY + row * (marginY + kAppViewH);
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, kAppViewW, kAppViewH)];
        //appView.backgroundColor = [UIColor redColor];
        [self.view addSubview:appView];
        
        
        
        
        // 实现视图内部小细节
//        NSDictionary *dict = self.appList[i];
        AppInfo *appInfo = self.appList[i];
        
        // 1> UIImageView
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kAppViewW, 65)];
        //icon.backgroundColor = [UIColor greenColor];
        
        // 设置图像
//        icon.image = [UIImage imageNamed:dict[@"icon"]];
        icon.image = [UIImage imageNamed:appInfo.icon];
        // 设置图像填充模式，等比例显示(CTRL+6)
        icon.contentMode = UIViewContentModeScaleAspectFill;
        
        [appView addSubview:icon];
        
        // 2> UILabel -> 应用程序名称
        // CGRectGetMaxY(frame) = frame.origin.y + frame.size.height
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(icon.frame), kAppViewW, 20)];
        //label.backgroundColor = [UIColor blackColor];
        
        // 设置应用程序名称
//        label.text = dict[@"name"];
        label.text = appInfo.name;
        // 设置字体
        label.font = [UIFont systemFontOfSize:13.0];
        label.textAlignment = NSTextAlignmentCenter;
        
        [appView addSubview:label];
        
        // 3> UIButton -> 下载按钮
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), kAppViewW, 20)];
        //button.backgroundColor = [UIColor blueColor];
        
        // 背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        
        // 按钮都是有状态的，不同状态可以对应不同的标题
        [button setTitle:@"下载" forState:UIControlStateNormal];
        // 一定不要使用下面的方法，修改按钮标题
        // button.titleLabel.text = @"aaa";
        
        
        // 修改字体(titleLabel是只读的)
        // readonly表示不允许修改titleLabel的指针，但是可以修改label的字体
        // 提示：按钮的字体是不区分状态的
        button.titleLabel.font = [UIFont systemFontOfSize:12.0];
        
        [appView addSubview:button];
        
        
    }
    
    
    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 80, 90)];
//    view1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view1];
//    
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(140, 40, 80, 90)];
//    view2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view2];
//    
//    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(240, 40, 80, 90)];
//    view3.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view3];
//    
//    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(40, 150, 80, 90)];
//    view4.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view4];
//    
//    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(140, 150, 80, 90)];
//    view5.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view5];
//    
//    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(240, 150, 80, 90)];
//    view6.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view6];

    
}



@end
