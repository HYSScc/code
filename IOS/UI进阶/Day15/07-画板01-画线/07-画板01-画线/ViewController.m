//
//  ViewController.m
//  07-画板01-画线
//
//  Created by tom-pc on 15/11/23.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"
#import "MBProgressHUD+MJ.h"
#import "HandleImageView.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet PaintView *paintView;

@end

@implementation ViewController
#warning slider&&button
- (IBAction)valueChange:(UISlider *)sender {
    
    _paintView.width = sender.value;
}
- (IBAction)colorClick:(UIButton *)sender {
    
    _paintView.color = sender.backgroundColor;
}

#warning ToolBarButton
- (IBAction)clearScreen:(id)sender {
    [_paintView clearScreen];
}
- (IBAction)undo:(id)sender {
    [_paintView undo];
}
- (IBAction)eraser:(id)sender {
    _paintView.color = [UIColor whiteColor];
}
- (IBAction)selectedPicture:(id)sender {
    
    // 去用户的相册
    // 照片选择器
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    // 数据源
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.delegate = self; // 通过代理选中图片到画板
    
    [self presentViewController:picker animated:YES completion:nil];
}
// 代理方法，实现图片从相册到画板
// 选中照片的时候 调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"%@", info);
    
    UIImage *image = info[UIImagePickerControllerOriginalImage]; // []内的文字是一个字符串，拿到图片
    
    
    // 添加
    // 添加View
    HandleImageView *handleView = [[HandleImageView alloc] initWithFrame:self.paintView.frame];
    
    handleView.image = image;
    
    [self.view addSubview:handleView];
    
    // 给block赋值
    handleView.block = ^(UIImage *newImage){
        _paintView.image = newImage; // 将截屏后的图片传到画板属性
    };
    
    
//    _paintView.image = image; // 将图片传到画板属性
    
    [self dismissViewControllerAnimated:YES completion:nil]; // 选中照片的时候 自动退出一下。
}

- (IBAction)save:(id)sender {
    // 把画板截屏
    
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(_paintView.bounds.size, NO, 0.0);
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 把画板上的内容渲染到上下文
    [_paintView.layer renderInContext:ctx];
    // 获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 保存到用户的相册里面
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
// 保存到相册 回调的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) { // 保存失败
        [MBProgressHUD showError:@"保存失败"];
    }else{ // 保存成功
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
@end
