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
        [self setCellBoxObj: [[CellBox alloc]init: CGRectMake(0.0, self.view.bounds.size.height / 2 - 50, self.view.bounds.size.width, 101) numOfCell:10]];
        cellBoxObj.cellDataSourcedDelegate = self;
        [cellBoxObj show:self];
    }
}
//自定义 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)cV cellForItemAtIndexPath:(NSIndexPath *)indexPath cellWithIdentifier:(NSString *)cellID cellWantsIndex:(int)cellwWI{
    Cell *cell = [cV dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d",cellwWI];
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
    NSLog(@"%@",selectedCell.label.text);
    if ([selectedCell.label.text isEqualToString:@"1"]) {
        [(CellBox *)cVC close];
   }
}

-(void)collectionView:(UICollectionViewController *)cVC didSlideAtItem:(UICollectionViewCell *)cellItem{
    Cell *selectedCell = (Cell *)cellItem;
    NSLog(@"%@",selectedCell.label.text);
}

-(void)collectionViewColsed{
    if (cellBoxObj != nil) {
        cellBoxObj.cellDataSourcedDelegate = nil;
        [self setCellBoxObj:nil];
    }
}

@end
