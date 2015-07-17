#import <UIKit/UIKit.h>

@interface LineLayout : UICollectionViewFlowLayout{
    CGSize  sizeOfCell;
    CGFloat minimumLineSpacing;
    CGFloat mainCellLineSpacing;
    BOOL    firstLayout;
}

- (id)init:(CGSize)cellSize withMinimumLineSpacing:(CGFloat) minimumLS andMainCellLineSpacing:(CGFloat) mainCellLS;

@end
