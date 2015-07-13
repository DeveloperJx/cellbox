#import "CellBox.h"
#import "Cell.h"

@implementation Cell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont boldSystemFontOfSize:50.0];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textColor = [UIColor blackColor];
        _contetViewBackground = [[UIImageView alloc]initWithImage:[[CellBox alloc]scaleToSize:[UIImage imageNamed:@"backGround.jpeg"] size:frame.size]];
        [self.contentView addSubview:_contetViewBackground];
        [self.contentView addSubview:self.label];
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return self;
}

-(UICollectionViewCell *)setContentViewBackground:(UIImage *)bgImage{
    _contetViewBackground.image = [[CellBox alloc]scaleToSize:bgImage size:self.frame.size];
    return self;
}

@end
