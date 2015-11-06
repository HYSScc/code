//
//  GroupBuyingModel.h
//  Practice01
//
//  Created by tom-pc on 15/11/2.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuyingModel : NSObject
@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupBuyingModelWithDict:(NSDictionary *)dict; // 方法的首字母要小写，类名要大写

+ (NSMutableArray *)groupBuyingModel;
@end
