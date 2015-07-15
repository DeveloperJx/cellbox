//
//  CellBox.m
//  CellBox_OC
//
//  Created by Jx on 15/7/9.
//  Copyright © 2015年 Jx. All rights reserved.
/*
    Example：[[[CellBox alloc]init:2]show];
 */

#import "CellBox.h"
#import "LineLayout.h"
#import "Cell.h"

@implementation CellBox

-(instancetype)init:(int)numOfCell sizeOfCell:(CGSize)cellsize frameOfcollectionViewFrame:(CGRect)cvcFrame{
    cellNum = numOfCell;
    collectionViewFrame = cvcFrame;
    cellBackgroundImage = [self makeAImage:[UIColor yellowColor] size:CGRectMake(0, 0, 300, 300)];
    LineLayout *lineLayout = [[LineLayout alloc] init:cellsize];
    self = [super initWithCollectionViewLayout:lineLayout];
    return self;
}

-(void)viewDidLoad{
    self.collectionView.backgroundColor = [UIColor clearColor];
    cellID = [_cellDataSourcedDelegate registerCellClassForCllectionView:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    return cellNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID];
    return cell;
}
 
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

-(void)show:(UIViewController *)lastViewController{
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    blurView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    blurView.alpha = 0.8;
    blurView.frame = CGRectMake(0, 20, lastViewController.view.bounds.size.width, lastViewController.view.bounds.size.height);
    self.view.frame = collectionViewFrame;
    blurView.frame = collectionViewFrame;
    [lastViewController.view addSubview:blurView];
    [lastViewController.view addSubview:self.view];
    [lastViewController addChildViewController:self];
}

- (void)close{
    //[self.collectionView removeFromSuperview];
    [blurView removeFromSuperview];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    @try {
        [_cellDataSourcedDelegate collectionViewColsed];
    }
    @catch (NSException *exception) {
        NSLog(@"Delegate not work able");
    }
}

-(void)setCellBackgroundImage:(UIImage *)bgImage{
    cellBackgroundImage = bgImage;
}

- (UIImage *)makeAImage:(UIColor *)color size:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_cellDataSourcedDelegate) {
        [_cellDataSourcedDelegate collectionView:self didSelectItemAtIndexPath:indexPath];
    }
}

@end
