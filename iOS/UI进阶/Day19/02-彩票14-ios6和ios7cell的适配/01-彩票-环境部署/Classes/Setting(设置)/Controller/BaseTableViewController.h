//
//  BaseTableViewController.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *dataList; // 声明可变数组接收模型数据
@end
