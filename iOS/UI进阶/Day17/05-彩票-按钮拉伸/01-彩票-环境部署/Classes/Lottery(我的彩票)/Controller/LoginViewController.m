//
//  LoginViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "LoginViewController.h"

#import "UIImage+Tool.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImage *image = [UIImage imageNamed:@"RedButton"];
//    
//    // 拉伸
//    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
//    
//    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    // 设置登入按钮的图片 图片拉伸 调用分类的方法
    [_loginBtn setBackgroundImage:[UIImage imageWithResizableImageName:@"RedButton"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage imageWithResizableImageName:@"RedButtonPressed"] forState:UIControlStateHighlighted];
}

@end
