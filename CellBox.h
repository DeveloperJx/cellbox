//
//  CellBox.h
//  CellBox_OC
//
//  Created by Jx on 15/7/9.
//  Copyright © 2015年 Jx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CellBoxDataSource <NSObject>

@required

- (UICollectionViewCell *)collectionView:(UICollectionView *)cV cellForItemAtIndexPath:(NSIndexPath *)indexPath cellWithIdentifier:(NSString *)cellID;
- (NSString *)registerCellClassForCllectionView:(UICollectionView *) collectionView;

@optional

- (void)collectionView:(UICollectionViewController *)cVC didSlideAtItem:(UICollectionViewCell *)cellItem;
- (void)collectionView:(UICollectionViewController *)cVC didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionViewColsed;

@end

@interface CellBox : UICollectionViewController {
                   int  cellNum;
              NSString *cellID;
               UIImage *cellBackgroundImage;
          UIBlurEffect *blurEffect;
    UIVisualEffectView *blurView;
                CGSize  cellSize;
                CGRect  collectionViewFrame;
}

@property(nonatomic, weak) id<CellBoxDataSource> cellDataSourcedDelegate;

- (instancetype)init:(int)numOfCell sizeOfCell:(CGSize)cellsize frameOfcollectionViewFrame:(CGRect)cvcFrame;
- (void)show:(UIViewController *)lastViewController;
- (void)close;
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
- (void)setCellBackgroundImage:(UIImage *)bgImage;
- (UIImage *)makeAImage:(UIColor *)color size:(CGRect)rect;

@end
