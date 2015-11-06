//
//  CarGroup.h
//  Practice13
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *cars;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carGroupModelWithDict:(NSDictionary *)dict;
+ (NSArray *)carGroup;
@end
