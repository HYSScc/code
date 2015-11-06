//
//  Tg.h
//  02-团购，加载模型，显示基本数据
//
//  Created by tom-pc on 15/10/24.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tg : NSObject
@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgWithDict:(NSDictionary *)dict; // 类方法的首字符是小写的(方法的首字符都是小写的),类名首字符要大写
+ (NSMutableArray *)tgs;

@end
