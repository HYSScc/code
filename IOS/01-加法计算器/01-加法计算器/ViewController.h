//
//  ViewController.h
//  01-加法计算器
//
//  Created by tom-pc on 15/9/26.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 IBAction & IBOutlet
 
 IB:Interface Builder // 界面的构造器,编辑器,界面搭建
 
 1> IBAction : 表示要(如果需要监听按钮的点击方法，可以使用IBAction，就可以与IB进行连线，连线之后，在点击按钮时，就会执行相应地方法)
 2> IBOutlet : 插座(如果需要获得/修改界面上控件的属性，使用IBoutlet，就可以与IB进行连线)


*/
@interface ViewController : UIViewController

// 计算方法
- (IBAction)compute;

// 声明两个文本框属性
@property (nonatomic, weak) IBOutlet UITextField *num1;
@property (nonatomic, weak) IBOutlet UITextField *num2;

@property (nonatomic, weak) IBOutlet UILabel *resultLabel;


@end

