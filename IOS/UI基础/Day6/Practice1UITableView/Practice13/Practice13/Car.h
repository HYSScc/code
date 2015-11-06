//
//  Car.h
//  Practice13
//
//  Created by tom-pc on 15/11/4.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carModelWithDict:(NSDictionary *)dict;
+ (NSArray *)carModelWithArray:(NSArray *)array;

@end
