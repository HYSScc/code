//
//  ProductCell.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ProductCell.h"

#import "Product.h"

@interface ProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ProductCell

//- (instancetype)initWithCoder:(NSCoder *)aDecoder; // 不能用 这个方法调用时 还没有连好线
// xib加载完时调用
- (void)awakeFromNib
{
    _imageView.layer.cornerRadius = 10;
    _imageView.clipsToBounds = YES;
//    _imageView.layer.masksToBounds = YES; // 与上一句效果相同
}

- (void)setProduct:(Product *)product
{
    _product = product;
    
    _imageView.image = [UIImage imageNamed:product.icon];
    _label.text = product.title;
}

@end
