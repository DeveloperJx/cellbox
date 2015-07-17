
#import "LineLayout.h"


//#define ITEM_SIZE 180.0
//#define ITEM_SIZE_witdh 200.0
//#define ITEM_SIZE_height 200.0
//#define ACTIVE_DISTANCE 200
//#define ZOOM_FACTOR 0

@implementation LineLayout

- (id)init:(CGSize)cellSize withMinimumLineSpacing:(CGFloat) minimumLS andMainCellLineSpacing:(CGFloat) mainCellLS{
    self = [super init];
    if (self) {
        sizeOfCell = cellSize;
        firstLayout = YES;
        minimumLineSpacing = minimumLS;
        mainCellLineSpacing = mainCellLS;
        self.itemSize = cellSize;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //  确定了缩进，此处为上方、下方各缩进200
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        //  每个item在水平方向的最小间距
        self.minimumLineSpacing = minimumLS;
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds{
    return YES;
}

//  初始的layout外观将由该方法返回的UICollctionViewLayoutAttributes来决定
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    if (firstLayout) {
        [self.collectionView setContentOffset:CGPointMake(10 + sizeOfCell.width * 2 + minimumLineSpacing * 2 - mainCellLineSpacing, 0) animated:NO];
        firstLayout = !firstLayout;
    }
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
//    for (UICollectionViewLayoutAttributes* attributes in array) {
//        if (CGRectIntersectsRect(attributes.frame, rect)) {
//            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
//            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
//            if (ABS(distance) < ACTIVE_DISTANCE) {
//                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
//                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
//                attributes.zIndex = 1;
//            }
//        }
//    }
    return array;
}

//  自动对齐到网格
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //  proposedContentOffset是没有对齐到网格时本来应该停下来的位置
    /*CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x / 2 + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    //  当前显示的区域
    CGRect targetRect = CGRectMake(proposedContentOffset.x, proposedContentOffset.y, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    //  取当前显示的item
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    //  对当前屏幕中的UICollectionViewLayoutAttributes逐个与屏幕中心进行比较，找出最接近中心的一个
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }*/
    CGPoint pointAfterSlide;
    CGFloat rightSlideThreshold = 10 + sizeOfCell.width * 2 + minimumLineSpacing * 2 - mainCellLineSpacing + sizeOfCell.width / 2;
//    CGFloat rightSlideDoubleItemThreshold = 10 + sizeOfCell.width * 3 + minimumLineSpacing * 3 - mainCellLineSpacing + sizeOfCell.width / 2;
//    CGFloat leftSlideDoubleItemThreshold = 10 + sizeOfCell.width / 2;
    CGFloat leftSlideThreshold = 10 + sizeOfCell.width + minimumLineSpacing + sizeOfCell.width + minimumLineSpacing - sizeOfCell.width / 2;
    if (proposedContentOffset.x >= rightSlideThreshold) {
//        if (proposedContentOffset.x > rightSlideDoubleItemThreshold) {
//            if (lineLayoutDelegate) {
//                [lineLayoutDelegate isSlideToLeft:NO isNeedBeRefresh:YES];
//                [lineLayoutDelegate isSlideDouble];
//            }
//        }else{
//            pointAfterSlide = CGPointMake(10 + sizeOfCell.width * 3 + minimumLineSpacing * 3 - mainCellLineSpacing, proposedContentOffset.y);
//            if (lineLayoutDelegate) {
//                [lineLayoutDelegate isSlideToLeft:NO isNeedBeRefresh:YES];
//            }
//        }
        pointAfterSlide = CGPointMake(10 + sizeOfCell.width * 3 + minimumLineSpacing * 3 - mainCellLineSpacing, proposedContentOffset.y);
//        if (lineLayoutDelegate) {
//            [lineLayoutDelegate isSlideToLeft:NO isNeedBeRefresh:YES];
//        }
    }else{
        if (proposedContentOffset.x <= leftSlideThreshold) {
//            if (proposedContentOffset.x <= leftSlideDoubleItemThreshold) {
//                if (lineLayoutDelegate) {
//                    [lineLayoutDelegate isSlideToLeft:YES isNeedBeRefresh:YES];
//                    [lineLayoutDelegate isSlideDouble];
//                }
//            }else{
//                pointAfterSlide = CGPointMake(10 + sizeOfCell.width + minimumLineSpacing - mainCellLineSpacing, proposedContentOffset.y);
//                if (lineLayoutDelegate) {
//                    [lineLayoutDelegate isSlideToLeft:YES isNeedBeRefresh:YES];
//                }
//            }
            pointAfterSlide = CGPointMake(10 + sizeOfCell.width + minimumLineSpacing - mainCellLineSpacing, proposedContentOffset.y);
//            if (lineLayoutDelegate) {
//                [lineLayoutDelegate isSlideToLeft:YES isNeedBeRefresh:YES];
//            }
        }else{
            pointAfterSlide = CGPointMake(10 + sizeOfCell.width * 2 + minimumLineSpacing * 2 - mainCellLineSpacing, proposedContentOffset.y);
//            if (lineLayoutDelegate) {
//                [lineLayoutDelegate isNeedToBeRefresh:NO];
//            }
        }
    }
    return pointAfterSlide;
    //return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end