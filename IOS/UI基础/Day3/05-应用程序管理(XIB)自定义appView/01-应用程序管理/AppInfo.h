//
//  AppInfo.h
//  01-应用程序管理
//
//  Created by tom-pc on 15/10/1.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface AppInfo : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

/**
 @property
 
 1. 生成getter方法
 2. 生成setter方法
 3. 生成带下划线的成员变量（记录属性内容）
 
 readonly的属性不会生成带下划线的成员变量
*/

@property (nonatomic, strong, readonly) UIImage *image;

/**
 instancetype 主要用于在类方法实例化对象时，让编译器主动推断对象的实际类型
 
 以避免使用id，会造成开发中不必要的麻烦，减少出错几率
 
 instancetype是苹果在IOS7才开始主推的
 
 C++11 auto
 在swift语言中，绝大多数类的实例化，都不需要再指定类型
 
 instancetype只能用于返回值使用
*/
 
/** 通常在写模型的实例化方法时，以下两种方法，均要写出 */
/** 使用字典实例化模型 */
- (id)initWithDict:(NSDictionary *)dict;

/** 类方法可以快速实例化一个对象 */
+ (id)appInfoWithDict:(NSDictionary *)dict;

/** 返回所有plist中的数据数组 */
+ (NSArray *)appList;

@end
