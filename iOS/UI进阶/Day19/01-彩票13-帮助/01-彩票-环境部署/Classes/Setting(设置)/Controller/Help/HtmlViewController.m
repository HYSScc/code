//
//  HtmlViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "HtmlViewController.h"

#import "HelpHtmls.h"

@interface HtmlViewController ()<UIWebViewDelegate>

@end

@implementation HtmlViewController

- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancle)];
    self.navigationItem.leftBarButtonItem = cancle;
    
#warning 设置跳转界面内容
    UIWebView *webView = (UIWebView *)self.view; // 强转类型
    webView.delegate = self;
    
    // 加载资源包里面的Html
    NSURL *url = [[NSBundle mainBundle] URLForResource:_htmls.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)cancle
{
    // 回到上一个控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 加载完网页调用
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';", _htmls.ID];
    [webView stringByEvaluatingJavaScriptFromString:js];
}

@end
