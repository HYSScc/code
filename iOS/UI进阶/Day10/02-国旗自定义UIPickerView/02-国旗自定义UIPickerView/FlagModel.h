//
//  FlagModel.h
//  02-国旗自定义UIPickerView
//
//  Created by tom-pc on 15/11/10.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlagModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)flagWithDict:(NSDictionary *)dict;
+ (NSArray *)flagModel;

@end
