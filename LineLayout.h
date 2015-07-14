#import <UIKit/UIKit.h>

@protocol LineLayoutDelegate <NSObject>

@optional

- (void)slideStopAtItem:(id)collectionViewCellItem;

@end

@interface LineLayout : UICollectionViewFlowLayout{
    
}

@property(nonatomic, retain) id<LineLayoutDelegate> lineLayoutDelegate;

-(id)init:(CGSize)cellSize;

@end
