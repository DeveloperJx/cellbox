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
//    UIImage *bgImage = [UIImage imageNamed:@"backGround.jpeg"];
    /*if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }*/
//    self.extendedLayoutIncludesOpaqueBars = NO;
//    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
//    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    //self.view.backgroundColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.7];
    /*CGSize mainScreenSize = [UIScreen mainScreen].bounds.size;
    mainScreenSize.height = mainScreenSize.height - 20;
    bgImage = [self scaleToSize:bgImage size:mainScreenSize];*/
    //self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    self.collectionView.backgroundColor = [UIColor clearColor];
    cellID = [cellDataSourcedDelegate registerCellClassForCllectionView:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    return cellNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID];
//    [collectionView dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
//    cell.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.item];
//    UICollectionViewCell *cellTemp = [cell setContentViewBackground:cellBackgroundImage];
//    NSLog(@"%@",cell.label.text);
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
    // UIApplication.sharedApplication().keyWindow?.subviews.first as UIView?
    // UIView *superView = [[[UIApplication sharedApplication]keyWindow]subviews].firstObject;
    // UIView *contentView = [[UIView alloc]initWithFrame:superView.bounds];
    //contentView = cellController.view;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    blurView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    blurView.alpha = 0.8;
    blurView.frame = CGRectMake(0, 20, lastViewController.view.bounds.size.width, lastViewController.view.bounds.size.height);
    self.view.frame = collectionViewFrame;
    blurView.frame = collectionViewFrame;
    [lastViewController.view addSubview:blurView];
    [lastViewController.view addSubview:self.view];
    [lastViewController addChildViewController:self];
//    self.modalPresentationStyle = UIModalTransitionStyleCoverVertical;
//    [lastViewController presentViewController:self animated:YES completion:Nil];
//    [[UIApplication sharedApplication]keyWindow].rootViewController = self;
}

-(void)close{
    [self.collectionView removeFromSuperview];
    [blurView removeFromSuperview];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

-(void)setCellBackgroundImage:(UIImage *)bgImage{
    cellBackgroundImage = bgImage;
}

-(UIImage *)makeAImage:(UIColor *)color size:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Cell *selectedCell = (Cell *)[collectionView cellForItemAtIndexPath:indexPath];
    [selectedCell setContentViewBackground:[self makeAImage:[UIColor whiteColor] size:CGRectMake(0, 0, 300, 300)]];
    NSLog(@"%ld",(long)indexPath.item);
    if ((long)indexPath.item == 0) {
        [self close];
    }
}

@end
