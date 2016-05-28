//
//  AboutHeaderView.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "AboutHeaderView.h"

@implementation AboutHeaderView

+ (instancetype)headerView
{
    return [[NSBundle mainBundle] loadNibNamed:@"AboutHeaderView" owner:nil options:nil][0];
}

@end
