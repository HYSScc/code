//
//  HelpController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "HelpController.h"

#import "SettingArrowItem.h"
#import "SettingGroup.h"

#import "HelpHtmls.h"

#import "HtmlViewController.h"

#import "NavigationController.h"

@interface HelpController ()

@property (nonatomic, strong) NSArray *htmls;

@end

@implementation HelpController

- (NSArray *)htmls
{
    if (_htmls == nil) {
        _htmls = [HelpHtmls helpHtmls];
    }
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup0];
}

- (void)addGroup0
{
    NSMutableArray *items = [NSMutableArray array];
    
    for (HelpHtmls *model in self.htmls) {
        SettingArrowItem *item = [SettingArrowItem settingItemWithIcon:nil title:model.title destVcClass:nil]; // 多态
        
        [items addObject:item];
    }

    SettingGroup *group0 = [[SettingGroup alloc] init];
    
    group0.items = items;
    
    [self.dataList addObject:group0];
}

// 重写父类中cell的点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出每一行对应的Html模型
    HelpHtmls *html = self.htmls[indexPath.row];
    
    
    HtmlViewController *Hvc = [[HtmlViewController alloc] init];
    Hvc.title = html.title; // 设置跳转控制器的标题
    Hvc.htmls = html; // 将模型数据传递给跳转控制器
    
    // 包装成自定义导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Hvc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

@end
