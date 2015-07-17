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

#define EdgeInsets 24.0

@implementation CellBox

- (instancetype)init: (CGRect)cvcFrame numOfCell: (int) cellsNum{
    cellNum = cellsNum;
    cellNow = 1;
    cellSize = CGSizeMake(cvcFrame.size.width - EdgeInsets * 2, cvcFrame.size.height - 20);
    collectionViewFrame = cvcFrame;
    minimumLineSpacing = 12;
    mainCellLineSpacing = 24;
    LineLayout *lineLayout = [[LineLayout alloc] init:cellSize withMinimumLineSpacing:12 andMainCellLineSpacing:24];
    self = [super initWithCollectionViewLayout:lineLayout];
    return self;
}

-(void)viewDidLoad{
    self.collectionView.decelerationRate = 0.1;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    cellID = [_cellDataSourcedDelegate registerCellClassForCllectionView:self.collectionView];
    isThouch = NO;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    if (cellNow == 1 && cellNow != cellNum) {
        switch (indexPath.item) {
            case 0:
                if (_cellDataSourcedDelegate) {
                     cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNum];
                }
                break;
            case 1:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNum];
                }
                break;
            case 2:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:1];
                }
                break;
            case 3:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:2];
                }
                break;
            case 4:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:2];
                }
                break;
            default:
                break;
        }
    }else if(cellNow == cellNum){
        switch (indexPath.item) {
            case 0:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNow - 1];
                }
                break;
            case 1:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNow - 1];
                }
                break;
            case 2:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNow];
                }
                break;
            case 3:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:1];
                }
                break;
            case 4:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:1];
                }
                break;
            default:
                break;
        }
    }else{
        switch (indexPath.item) {
            case 0:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNow - 1];
                }
                break;
            case 1:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNow - 1];
                }
                break;
            case 2:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNow];
                }
                break;
            case 3:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNow + 1];
                }
                break;
            case 4:
                if (_cellDataSourcedDelegate) {
                    cell = [_cellDataSourcedDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cellWithIdentifier:cellID cellWantsIndex:cellNow + 1];
                }
                break;
            default:
                break;
        }
    }
    
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
//    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    blurView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
//    blurView.alpha = 0.8;
//    blurView.frame = CGRectMake(0, 20, lastViewController.view.bounds.size.width, lastViewController.view.bounds.size.height);
    self.view.frame = collectionViewFrame;
//    blurView.frame = collectionViewFrame;
//    [lastViewController.view addSubview:blurView];
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

//-(void)setCellBackgroundImage:(UIImage *)bgImage{
//    cellBackgroundImage = bgImage;
//}

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
    [self.collectionView setScrollEnabled:YES];
    if (_cellDataSourcedDelegate) {
        [_cellDataSourcedDelegate collectionView:self didSelectItemAtIndexPath:indexPath];
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    isThouch = YES;
    scrollView.decelerationRate = 0.1;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (decelerate && isThouch)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            printf("STOP IT!!\n");
            [scrollView setContentOffset:scrollView.contentOffset animated:NO];
        }); 
    }
    isThouch = NO;
    CGPoint offset = [self targetContentOffsetForProposedContentOffset:self.collectionView.contentOffset];
    NSLog(@"%f,%f",offset.x,self.collectionView.contentOffset.x);
    dispatch_async(dispatch_get_main_queue(), ^{
        printf("STOP IT!!\n");
        ///////////////
        [scrollView setContentOffset:offset animated:YES];
    });
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self reloadCells];
    if (self.cellDataSourcedDelegate) {
        //ollectionView:self didSlideAtItem:self.collectionView cellForItemAtIndexPath:[[NSIndexPath alloc]initWithIndexes:cellNow length:0]
        @try {
            [self.cellDataSourcedDelegate collectionView:self didSlideAtItem:[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]]];
        }
        @catch (NSException *exception) {
            
        }
    }
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset{
    CGPoint pointAfterSlide;
    CGFloat rightSlideThreshold = 10 + cellSize.width * 2 + minimumLineSpacing * 2 - mainCellLineSpacing + cellSize.width / 2;
    CGFloat leftSlideThreshold = 10 + cellSize.width + minimumLineSpacing + cellSize.width + minimumLineSpacing - cellSize.width / 2;
    if (proposedContentOffset.x >= rightSlideThreshold) {
        if (cellNow != cellNum) {
            cellNow++;
        }else{
            cellNow = 1;
        }
        pointAfterSlide = CGPointMake(10 + cellSize.width * 3 + minimumLineSpacing * 3 - mainCellLineSpacing, proposedContentOffset.y);
    }else{
        if (proposedContentOffset.x <= leftSlideThreshold) {
            if (cellNow != 1) {
                cellNow--;
            }else{
                cellNow = cellNum;
            }
            pointAfterSlide = CGPointMake(10 + cellSize.width + minimumLineSpacing - mainCellLineSpacing, proposedContentOffset.y);
        }else{
            pointAfterSlide = CGPointMake(10 + cellSize.width * 2 + minimumLineSpacing * 2 - mainCellLineSpacing, proposedContentOffset.y);
        }
    }
    return pointAfterSlide;
}

- (void)reloadCells{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
        [self.collectionView setContentOffset: CGPointMake(10 + (collectionViewFrame.size.width - 48) * 2 + minimumLineSpacing * 2 - mainCellLineSpacing, 0) animated:NO];
    });
}

@end
