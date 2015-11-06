//
//  StatusFrame.m
//  05-新浪微博，基本数据加载
//
//  Created by tom-pc on 15/10/26.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "StatusFrame.h"
#import "status.h"
#import <UIKit/UIKit.h>
// 姓名字体
#define kNameFont [UIFont systemFontOfSize:14]
// 正文字体
#define kTextFont [UIFont systemFontOfSize:16]
@interface StatusFrame ()

@end

@implementation StatusFrame

- (void)setStatus:(status *)status
{
    _status = status;
    // 0. 定义间距
    CGFloat padding = 10;
    // 1. 头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    self.iconF = CGRectMake(iconX, iconY, iconW, iconH);
    // 2.姓名大小由文字的长度来决定
    // boundingRectWithSize计算给定文本字符串所占区域
    // 返回值是一个x，y = 0的CGRect
    // 如果要计算多行的准确高度，需要传人NSStringDrowingUsesLineFragmentOrigin选项
    // dict用于指定字体的相关属性的字典，UIKit框架中的第一个头文件
    
    
    NSDictionary *nameDict = @{NSFontAttributeName : kNameFont};
    
    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    nameFrame.origin.x = CGRectGetMaxX(self.iconF) + padding;
    nameFrame.origin.y = padding + (self.iconF.size.height - nameFrame.size.height) * 0.5;
    self.nameF = nameFrame;
    
    // 3.vip图标
    CGFloat vipX = CGRectGetMaxX(self.nameF) + padding;
    CGFloat vipY = self.nameF.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    self.vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 4.正文
    NSDictionary *textDict = @{NSFontAttributeName : kTextFont};
    CGRect textFrame = [self.status.text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(self.iconF) + padding;
    self.textF = textFrame;
    
    
    // 5.配图
    if (self.status.picture.length > 0) {
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        self.pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        self.cellHeight = CGRectGetMaxY(self.pictureF) + padding;
    } else
    {
        self.cellHeight = CGRectGetMaxY(self.textF) + padding;
    }
    
}

+ (NSArray *)statusFrames
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        // 要添加statusFrame对象
        StatusFrame *statusFrame = [[StatusFrame alloc] init];
        
        // 实例化一个新的Status模型
        status *sta = [status statusWithDict:dict];
        
        // 调用自己的setter方法，保存status数据模型，同时计算出所有控件的位置
        statusFrame.status = sta;
        
        // 将statusFrame添加到数组
        [arrayM addObject:statusFrame];
    }
    return arrayM;
}

@end
