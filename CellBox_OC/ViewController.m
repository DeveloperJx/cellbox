//
//  ViewController.m
//  CellBox_OC
//
//  Created by Jx on 15/7/8.
//  Copyright (c) 2015年 Jx. All rights reserved.
//

#import "ViewController.h"
#import "CellBox.h"

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (IBAction)test:(id)sender {
    CellBox *cellBoxObj = [[CellBox alloc]init:5 sizeOfCell:CGSizeMake(100.0, 100.0) frameOfcollectionViewFrame:CGRectMake(0.0, 200, self.view.bounds.size.width, 200)];
    [cellBoxObj setCellBackgroundImage:[UIImage imageNamed:@"apple.png"]];
    [cellBoxObj show:self];
}

@end
