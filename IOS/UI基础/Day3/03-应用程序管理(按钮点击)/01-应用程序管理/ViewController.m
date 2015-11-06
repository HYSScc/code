//
//  ViewController.m
//  01-应用程序管理
//
//  Created by tom-pc on 15/10/1.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
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
        
//        // appList保存的是字典=>模型
////        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
////        _appList = [NSArray arrayWithContentsOfFile:path];
//        
//        // 数组中保存的是字典
//        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
//        
//        // 创建一个临时数组
//        NSMutableArray *arrayM = [NSMutableArray array];
//        // 遍历数组，依次转换模型
//        for (NSDictionary *dict in array){
//            
////            AppInfo *appInfo = [[AppInfo alloc] init];
////            AppInfo *appInfo = [[AppInfo alloc] initWithDict:dict];
//            // 实例化字典之后，可以将后两个代码，写在模型中
//            
//            // 类方法可以快速实例化一个对象
////            AppInfo *appInfo = [AppInfo appInfoWithDict:dict];
//            
//
//            
////            [arrayM addObject:appInfo]; // 将设置好属性的数组，放到这个可变的空数组中
//            [arrayM addObject:[[AppInfo alloc] initWithDict:dict]];
//            
//        }
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
//        icon.image = [UIImage imageNamed:appInfo.icon];
        icon.image = appInfo.image;
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
        label.font = [UIFont systemFontOfSize:10.0];
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
        
        // 给按钮添加监听方法
        button.tag = i;
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

/** 按钮监听方法 */
- (void)click:(UIButton *)button
{
    NSLog(@"%s %ld", __func__, button.tag);
    
    // 取出appInfo
    AppInfo *appInfo = self.appList[button.tag];
    
    // 添加一个UILabel到界面上
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 520, 160, 40)];
    // 数值是0表示黑色，1表示纯白
    // alpha表示透明度
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    
    label.text = appInfo.name;
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    
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
    
    
    
    // 首尾式动画，不容易监听动画完成时间。而且不容易实现动画的嵌套
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0f];
//    
//    label.alpha = 1.0;
//    [UIView commitAnimations];
}




@end
