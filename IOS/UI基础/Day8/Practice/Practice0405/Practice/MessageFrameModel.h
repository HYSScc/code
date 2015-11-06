//
//  MessageFrameModel.h
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@class MessageModel;
@interface MessageFrameModel : NSObject
@property (nonatomic, assign) CGRect timeF;
@property (nonatomic, assign) CGRect textViewBtnF;
@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGFloat cellHeight;
// 数据模型
@property (nonatomic, strong) MessageModel *messageModel;
// 模型的类方法
+ (NSMutableArray *)messageFrameModel;
@end
