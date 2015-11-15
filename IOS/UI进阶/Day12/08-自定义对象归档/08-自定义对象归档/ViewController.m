//
//  ViewController.m
//  08-自定义对象归档
//
//  Created by tom-pc on 15/11/15.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)save:(id)sender {
    // 获取沙盒的根路径
    NSString *home = NSHomeDirectory();
    NSLog(@"%@", home);
    
    Person *p = [[Person alloc] init];
    p.age = 18;
    
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]; //只有一个Documents iOS中
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]; // 获取Caches文件夹
    
    
    // 拼接文件路径
    NSString *filePath = [path stringByAppendingPathComponent:@"person.data"];
   
    // 键值归档类
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
    
}
- (IBAction)read:(id)sender {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]; // 获取Caches文件夹
    
    
    // 拼接文件路径
    NSString *filePath = [path stringByAppendingPathComponent:@"person.data"];
    
    // 解档
    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", person);
}


@end
