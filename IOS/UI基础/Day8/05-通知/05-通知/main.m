//
//  main.m
//  05-通知
//
//  Created by tom-pc on 15/10/31.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "XQCompany.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1.初始化两个机构
        XQCompany *za = [[XQCompany alloc] init];
        za.name = @"珍爱网";
        
        XQCompany *sj = [[XQCompany alloc] init];
        sj.name = @"世纪佳缘";
        
        // 2.初始化三个人
        Person *zhangsan = [[Person alloc] init];
        zhangsan.name = @"张三";
        
        Person *lishishi = [[Person alloc] init];
        lishishi.name = @"李诗诗";
        
        Person *lisi = [[Person alloc] init];
        lisi.name = @"李四";
        
        // 3.监听
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        /**
           1> addObserver 监听者
           2> selector    回调的方法
           3> name        监听通知的名称(nil 所有的通知名称)
           4> object      发布者(nil 所有发布者)
         */
        [center addObserver:zhangsan selector:@selector(person:) name:nil object:za];
        [center addObserver:lishishi selector:@selector(person:) name:nil object:sj];
        [center addObserver:lisi selector:@selector(person:) name:nil object:nil];
        
        // 4.发布
        /**
           1> postNotificationName: 通知的名称
           2> object: 发布者
           3> userInfo: 额外信息
         */
        [center postNotificationName:@"zhenaiwang" object:za userInfo:@{@"title" : @"新来的女的",
                                                                        @"info" : @"\\\\"}];
        [center postNotificationName:@"shijijiayuan" object:sj userInfo:@{@"title" : @"新来的男的",
                                                                        @"info" : @"\\\\"}];
        
    }
    return 0;
}
