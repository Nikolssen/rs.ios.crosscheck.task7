//
//  NumberButton.m
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import "NumberButton.h"
@interface NumberButton()
@property (nonatomic, strong) UIBezierPath* path;
@end
@implementation NumberButton

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return [self.path containsPoint:point];
}

-(void)setRadius:(CGFloat)radius{
    _radius = radius;
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, radius*2, radius*2);
    _path = [UIBezierPath bezierPathWithOvalInRect:self.frame];
   
}


-(void)setColor:(UIColor *)color{
    _color = color;
    self.layer.borderColor = color.CGColor;
    self.titleLabel.textColor = color;
}

- (void) awakeFromNib{
    [super awakeFromNib];
    self.clipsToBounds = true;
    
}





@end
