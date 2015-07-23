//
//  ViewController.h
//  CellBox_OC
//
//  Created by Jx on 15/7/8.
//  Copyright (c) 2015年 Jx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellBox.h"

@interface ViewController : UIViewController <CellBoxDataSource>{
//    CellBox *cellBoxObj;
}

@property(nonatomic,readwrite)CellBox *cellBoxObj;

@end

