#import <UIKit/UIKit.h>

@protocol LineLayoutDelegate <NSObject>

@required

- (void)isSlideToLeft:(BOOL)slideDirectionIsLeft isNeedBeRefresh:(BOOL)isNeedToBeRefresh;
- (void)isNeedToBeRefresh:(BOOL)isNeedToBeRefresh;

@end

@interface LineLayout : UICollectionViewFlowLayout{
    CGSize  sizeOfCell;
    CGFloat minimumLineSpacing;
    CGFloat mainCellLineSpacing;
    BOOL    firstLayout;
}

@property(nonatomic, retain) id<LineLayoutDelegate> lineLayoutDelegate;

- (id)init:(CGSize)cellSize withMinimumLineSpacing:(CGFloat) minimumLS andMainCellLineSpacing:(CGFloat) mainCellLS;

@end
