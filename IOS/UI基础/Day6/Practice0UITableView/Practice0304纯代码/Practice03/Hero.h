//
//  Hero.h
//  Practice03
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)heroModelWithDict:(NSDictionary *)dict;

+ (NSArray *)heroModel;
@end
