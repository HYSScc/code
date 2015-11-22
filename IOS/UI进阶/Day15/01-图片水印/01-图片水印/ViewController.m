//
//  ViewController.m
//  01-图片水印
//
//  Created by tom-pc on 15/11/22.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *oldImage = [UIImage imageNamed:@"img"];
    
    // 1.开启位图上下文
    // size 新的图片的大小(一般与图片大小一样，先获取图片，再赋值图片的size属性)
    // opaque 透明度 YES 不透明 NO 透明
    // 缩放（一般不需要缩放）
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0); // 开启了与图片大小相同的上下文
    
    // 2.将图片画到上下文
    [oldImage drawAtPoint:CGPointZero];
    
    // 3.添加文字
    NSString *text = @"你不读书还想太多";
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:15],
                           NSForegroundColorAttributeName : [UIColor redColor]
                           };
    [text drawAtPoint:CGPointMake(0, 0) withAttributes:dict];
    
    // 4.把图形上下文生成UIImage
    // 获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文(不关闭会一直消耗内存)
    UIGraphicsEndImageContext();
    
    _imageView.image = newImage;
    
    // 将图片保存到桌面
//    NSData *data = [UIImageJPEGRepresentation(<#UIImage * _Nonnull image#>, 0.0001)]; // 带压缩模糊
    // 把图片转换成PNG格式的二进制数据
    NSData *data = UIImagePNGRepresentation(newImage); // 最清晰的
    [data writeToFile:@"/Users/tom/Desktop/newImage.png" atomically:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
