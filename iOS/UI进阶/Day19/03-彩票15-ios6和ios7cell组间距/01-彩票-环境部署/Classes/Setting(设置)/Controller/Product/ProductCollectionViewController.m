//
//  ProductCollectionViewController.m
//  01-彩票-环境部署
//
//  Created by tom-pc on 15/12/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ProductCollectionViewController.h"

#import "Product.h"

#import "ProductCell.h"

/*
  使用UICollectionView
  第一步：必须有布局
  第二步：cell必须自己注册
 */

@interface ProductCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *products; // 数组供json文件使用

@end

@implementation ProductCollectionViewController
// 懒加载数组
- (NSMutableArray *)products
{
    if (_products == nil) {
        _products = [Product products];
    }
    return _products;
}

static NSString * const reuseIdentifier = @"Cell";
// 重写init方法 将initWithCollectViewLayout方法封装进init
- (instancetype)init
{
    // 创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];// 创建一个布局对象
    
    // 每一个cell的尺寸
    layout.itemSize = CGSizeMake(90, 90);
    
    // 垂直间距
    layout.minimumLineSpacing = 10;
    
    // 水平间距
    layout.minimumInteritemSpacing = 2.5;
    
    // 内边距
    layout.sectionInset = UIEdgeInsetsMake(4, 2.5, 0, 2.5);
    
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@---%@", self.view, self.collectionView);
    
    // 从XIB中加载
    UINib *xib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
    [self.collectionView registerNib:xib forCellWithReuseIdentifier:reuseIdentifier];
    // 注册 cell classes 注册UICollectionViewCell，如果没有从缓存池找到，就会自动帮我们创建UICollectionViewCell
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 取出模型
    Product *model = self.products[indexPath.item];
    
    // 设置cell内容
    cell.product = model;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出模型
    Product *model = self.products[indexPath.item];
    
    NSLog(@"点击了%@", model.title);
}

@end
