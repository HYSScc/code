//
//  ViewController.m
//  Practice02
//
//  Created by tom-pc on 15/11/5.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@end

@implementation ViewController

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
    [self.imageView sizeToFit];
    
    self.scrollView.contentSize = image.size;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.image = [UIImage imageNamed:@"minio"];
}


@end
