//
//  MyProtocol.h
//  02-protocol
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义了一个名叫MyProtocol的协议
@protocol MyProtocol <NSObject>
// @required // 必须实现
// @optional // 选择实现

@required // 必须实现
- (void)test;
@optional // 选择实现
- (void)test2;

@end
