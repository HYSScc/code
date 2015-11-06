//
//  AppInfo.m
//  01-应用程序管理
//
//  Created by tom-pc on 15/10/1.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo
// 合成指令,主动指定属性使用的成员变量名称
@synthesize image = _image;

/**
 使用KVC的注意事项
 
 1> plist中的键值名称必须与模型中的属性一致。
 2> 模型中的属性可以不出现在plist文件中
 
 */

- (UIImage *)image
{
    if (_image == nil) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // 用字典给属性赋值，所有与plist键值有关的方法，均在此处
//        self.name = dict[@"name"];
//        self.icon = dict[@"icon"];
        
        // KVC - key value coding 键值编码
        // 是一种间接修改/读取对象属性的一种方法
        // KVC 被称为 cocoa 的大招
        // 参数
        // 1. 数值
        // 2. 属性名称
//        [self setValue:dict[@"name"] forKeyPath:@"name"];
//        [self setValue:dict[@"icon"] forKeyPath:@"icon"];
        // setValuesForKeysWithDictionary本质上就是调用以上两句代码
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (id)appInfoWithDict:(NSDictionary *)dict
{
    // self 是 class
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)appList
{
    // appList保存的是字典=>模型
    //        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
    //        _appList = [NSArray arrayWithContentsOfFile:path];
    
    // 数组中保存的是字典
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
    
    // 创建一个临时数组
    NSMutableArray *arrayM = [NSMutableArray array];
    // 遍历数组，依次转换模型
    for (NSDictionary *dict in array){
        
        //            AppInfo *appInfo = [[AppInfo alloc] init];
        //            AppInfo *appInfo = [[AppInfo alloc] initWithDict:dict];
        // 实例化字典之后，可以将后两个代码，写在模型中
        
        // 类方法可以快速实例化一个对象
        //            AppInfo *appInfo = [AppInfo appInfoWithDict:dict];
        
        
        
        //            [arrayM addObject:appInfo]; // 将设置好属性的数组，放到这个可变的空数组中
        [arrayM addObject:[[AppInfo alloc] initWithDict:dict]];
        
    }
    return arrayM;
}

@end
