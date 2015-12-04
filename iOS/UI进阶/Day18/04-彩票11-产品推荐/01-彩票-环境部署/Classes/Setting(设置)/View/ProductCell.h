//
//  ProductCell.h
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;

@interface ProductCell : UICollectionViewCell

@property (nonatomic, strong) Product *product; // 声明模型属性

@end
