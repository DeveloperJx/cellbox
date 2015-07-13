//
//  ViewController.m
//  CellBox_OC
//
//  Created by Jx on 15/7/8.
//  Copyright (c) 2015年 Jx. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)test:(id)sender {
    CellBox *cellBoxObj = [[CellBox alloc]init:5 sizeOfCell:CGSizeMake(100.0, 100.0) frameOfcollectionViewFrame:CGRectMake(0.0, 200, self.view.bounds.size.width, 200)];
    cellBoxObj.delegate = self;
    [cellBoxObj setCellBackgroundImage:[UIImage imageNamed:@"apple.png"]];
    [cellBoxObj show:self];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)cV cellForItemAtIndexPath:(NSIndexPath *)indexPath cellWithIdentifier:(NSString *)cellID{
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

@end
