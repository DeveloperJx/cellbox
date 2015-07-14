//
//  ViewController.m
//  CellBox_OC
//
//  Created by Jx on 15/7/8.
//  Copyright (c) 2015年 Jx. All rights reserved.
//

#import "ViewController.h"
#import "CellBox.h"
#import "Cell.h"

@implementation ViewController
@synthesize cellBoxObj;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)test:(id)sender {
    if (cellBoxObj == nil) {
        [self setCellBoxObj: [[CellBox alloc]init:5 sizeOfCell:CGSizeMake(100.0, 100.0) frameOfcollectionViewFrame:CGRectMake(0.0, 200, self.view.bounds.size.width, 200)]];
        cellBoxObj.cellDataSourcedDelegate = self;
        [cellBoxObj setCellBackgroundImage:[UIImage imageNamed:@"apple.png"]];
        [cellBoxObj show:self];
    }
}
//自定义 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)cV cellForItemAtIndexPath:(NSIndexPath *)indexPath cellWithIdentifier:(NSString *)cellID{
    Cell *cell = [cV dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.item];
    //UICollectionViewCell *cellTemp = [cell setContentViewBackground:cellBackgroundImage];
    //    NSLog(@"%@",cell.label.text);
    return cell;
}

- (NSString *)registerCellClassForCllectionView:(UICollectionView *)collectionView{
    [collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"MY_CELL"];
    return @"MY_CELL";
}
//选择Item
- (void)collectionView:(UICollectionViewController *)cVC didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Cell *selectedCell = (Cell *)[cVC.collectionView cellForItemAtIndexPath:indexPath];
    [selectedCell setContentViewBackground: [[CellBox alloc] makeAImage:[UIColor whiteColor] size:CGRectMake(0, 0, 300, 300)]];
    NSLog(@"%ld",(long)indexPath.item);
    if ((long)indexPath.item == 0) {
        [(CellBox *)cVC close];
   }
}

-(void)collectionViewColsed{
    if (cellBoxObj != nil) {
        cellBoxObj.cellDataSourcedDelegate = nil;
        [self setCellBoxObj:nil];
    }
}

@end
