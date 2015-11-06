//
//  Student.h
//  Pracetice01LOL
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
// 头部文字
@property (nonatomic, copy) NSString *title;
// 尾部文字
@property (nonatomic, copy) NSString *desc;
// 学员编号数组
@property (nonatomic, strong) NSArray *students;
@end
