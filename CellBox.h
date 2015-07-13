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

@end

@interface CellBox : UICollectionViewController {
 id<CellBoxDataSource>  cellDataSourcedDelegate;
                   int  cellNum;
              NSString *cellID;
               UIImage *cellBackgroundImage;
          UIBlurEffect *blurEffect;
    UIVisualEffectView *blurView;
                CGSize  cellSize;
                CGRect  collectionViewFrame;
}

@property(nonatomic, retain) id<CellBoxDataSource> delegate;

-(instancetype)init:(int)numOfCell sizeOfCell:(CGSize)cellsize frameOfcollectionViewFrame:(CGRect)cvcFrame;
-(void)show:(UIViewController *)lastViewController;
-(void)close;
-(UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
-(void)setCellBackgroundImage:(UIImage *)bgImage;

@end
