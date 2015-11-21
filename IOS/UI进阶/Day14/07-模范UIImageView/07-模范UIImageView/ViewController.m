//
//  ViewController.m
//  07-模范UIImageView
//
//  Created by tom-pc on 15/11/21.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "ImageView.h"

@interface ViewController ()
@property (nonatomic, strong) ImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      ImageView *imageView = [[ImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
      imageView.image = [UIImage imageNamed:@"你有我牛B吗"];
    
      [self.view addSubview:imageView];
    
    _imageView = imageView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _imageView.image = [UIImage imageNamed:@"未来苹果CEO"];
}
@end
