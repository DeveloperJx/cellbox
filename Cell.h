#import <UIKit/UIKit.h>

@interface Cell : UICollectionViewCell{
    
}

@property (strong, nonatomic) UILabel* label;
@property (strong, nonatomic) UIImageView *contetViewBackground;

-(UICollectionViewCell *)setContentViewBackground:(UIImage *)bgImage;

@end
