//
//  StatusCell.h
//  05-新浪微博，基本数据加载
//
//  Created by tom-pc on 15/10/25.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class status;
@interface StatusCell : UITableViewCell
@property (nonatomic, strong) status *status;
@property (nonatomic, assign) CGFloat cellHeight;

@end
