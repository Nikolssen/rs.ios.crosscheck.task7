//
//  AuthorizationButton.m
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import "AuthorizationButton.h"
#import "UIColor+TaskColors.h"
@interface AuthorizationButton()
@property (nonatomic, strong) UIImageView* userImageView;
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIImage* selectedImage;
@property (nonatomic, strong) UIImage* deselectedImage;
@property (nonatomic, strong) UIBezierPath* path;
@end
@implementation AuthorizationButton
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupViews];
    
}
- (void) setupViews{
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor littleBoyBlue].CGColor;
    self.layer.borderWidth = 2.0;
    self.layer.cornerRadius = 10.0;
    self.selectedImage = [UIImage imageNamed:@"user-filled"];
    self.deselectedImage = [UIImage imageNamed:@"user"];
    self.userImageView = [[UIImageView alloc] initWithImage: self.deselectedImage];
    self.userImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.label = [UILabel new];
    self.label.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightMedium];
    self.label.textColor = [UIColor littleBoyBlue];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines = 1;
    self.label.text = @"Authorize";
    [self addSubview:self.label];
    [self addSubview:self.userImageView];


}

- (void)layoutSubviews{
    self.userImageView.frame = CGRectMake(20, 10, 20, 22);
    self.label.frame = CGRectMake(45, 10, 102, 22);
    self.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius];
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted: highlighted];
    if (highlighted){
        self.userImageView.image = self.selectedImage;
        self.backgroundColor = [[UIColor littleBoyBlue] colorWithAlphaComponent: 0.2];
        self.label.textColor = [[UIColor littleBoyBlue] colorWithAlphaComponent:0.4];
    }
    else
    {
        self.userImageView.image = self.deselectedImage;
        self.backgroundColor = [UIColor whiteColor];
        self.label.textColor = [UIColor littleBoyBlue];
    }
    
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    if (!enabled){
        self.alpha = 0.5;
    }
    else
    {
        self.alpha = 1.0;
    }
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return [self.path containsPoint:point];
}
- (instancetype) init{
    self = [super init];
    if (self){
        [self setupViews];
    }
    return self;
}
@end
