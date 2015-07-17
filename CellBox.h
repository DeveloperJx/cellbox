//
//  CellBox.h
//  CellBox_OC
//
//  Created by Jx on 15/7/9.
//  Copyright © 2015年 Jx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NOT_SLIDE   1
#define SLIDE_LEFT  0
#define SLIDE_RIGHT 2

@protocol CellBoxDataSource <NSObject>

@required

- (UICollectionViewCell *)collectionView:(UICollectionView *)cV cellForItemAtIndexPath:(NSIndexPath *)indexPath cellWithIdentifier:(NSString *)cellID cellWantsIndex:(int)cellwWI;
- (NSString *)registerCellClassForCllectionView:(UICollectionView *) collectionView;

@optional

- (void)collectionView:(UICollectionViewController *)cVC didSlideAtItem:(UICollectionViewCell *)cellItem;
- (void)collectionView:(UICollectionViewController *)cVC didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionViewColsed;

@end

@interface CellBox : UICollectionViewController {
                   int  cellNum;
                   int  cellNow;
                   int  stateOfSlide;
              NSString *cellID;
          UIBlurEffect *blurEffect;
    UIVisualEffectView *blurView;
                CGSize  cellSize;
                CGRect  collectionViewFrame;
               NSArray *dataArray;
                  BOOL  isThouch;
               CGFloat  minimumLineSpacing;
               CGFloat  mainCellLineSpacing;
}

@property(nonatomic, weak) id<CellBoxDataSource> cellDataSourcedDelegate;

- (instancetype)init: (CGRect)cvcFrame numOfCell: (int) cellsNum;
- (void)show:(UIViewController *)lastViewController;
- (void)close;
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
- (UIImage *)makeAImage:(UIColor *)color size:(CGRect)rect;

@end
