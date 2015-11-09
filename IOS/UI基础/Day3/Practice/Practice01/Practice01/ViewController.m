//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "App.h"

#define xAppViewW 65
#define xAppViewH 105
#define xColCount 3

@interface ViewController ()
@property (nonatomic, strong)NSArray *appList;

@end

@implementation ViewController

- (NSArray *)appList
{
    if (_appList == nil) {
        _appList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in _appList) {
            App *appModel = [[App alloc] init];
            
            appModel.name = dict[@"name"];
            appModel.icon = dict[@"icon"];
            
            [arrayM addObject:appModel];
        }
        _appList = arrayM;
    }
    return _appList;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat paddingX = (self.view.bounds.size.width - xAppViewW * xColCount) * 0.25;
    CGFloat paddingY = 45;
    
    for (int i = 0; i < self.appList.count; i++) {
        int row = i / xColCount; // 行
        int col = i % xColCount; // 列
        
        CGFloat x = paddingX + col * (xAppViewW + paddingX);
        CGFloat y = paddingY + row * (xAppViewH + paddingY);
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, xAppViewW, xAppViewH)];
//        appView.backgroundColor = [UIColor redColor];
        [self.view addSubview:appView];
        
        // 拿出对应字典数据
//        NSDictionary *dict = self.appList[i];
        App *model = self.appList[i];
        
        // 实现视图内部细节
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, xAppViewW, 65)];
        [appView addSubview:icon];
        // 设置图像
//        icon.image = [UIImage imageNamed:dict[@"icon"]];
        icon.image = [UIImage imageNamed:model.icon];
        icon.contentMode = UIViewContentModeScaleAspectFill; // 填充模式
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(icon.frame), xAppViewW, 20)];
        [appView addSubview:label];
        // 设置label
//        label.text = dict[@"name"];
        label.text = model.name;
        label.font = [UIFont systemFontOfSize:10.0]; // 设置字体大小
        label.textAlignment = NSTextAlignmentCenter; // 设置垂直居中
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), xAppViewW, 20)];
        [appView addSubview:button];
        // 背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        [button setTitle:@"下载" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12.0];
        
    }
    
}

@end
