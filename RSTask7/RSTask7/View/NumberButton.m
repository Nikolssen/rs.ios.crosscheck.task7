//
//  NumberButton.m
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import "NumberButton.h"
#import "UIColor+TaskColors.h"
@interface NumberButton()
@property (nonatomic, strong) UIBezierPath* path;
@end
@implementation NumberButton

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return [self.path containsPoint:point];
}


- (void) awakeFromNib{
    [super awakeFromNib];
    [self configureUI];
    
}

- (void) configureUI{
    self.titleLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightSemibold];
    self.clipsToBounds = true;
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor littleBoyBlue].CGColor;
    [self setTitleColor:[UIColor littleBoyBlue] forState:UIControlStateNormal];
    self.layer.cornerRadius = 25.0;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 50, 50);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
}

-(instancetype) init{
    self = [super init];
    if (self){
        [self configureUI];
    }
    return self;
}
- (void) setTitle:(NSString *)title forState:(UIControlState)state{
    NSString* number = [title substringWithRange:NSMakeRange(0, 1)];
    [super setTitle:number forState:state];
}
- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted: highlighted];
    if (highlighted){
        self.backgroundColor = [[UIColor littleBoyBlue] colorWithAlphaComponent: 0.2];
        self.titleLabel.alpha = 1.0;
    }
    else
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    
}




@end
