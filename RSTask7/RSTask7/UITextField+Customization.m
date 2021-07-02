//
//  UITextField+Customization.m
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import "UITextField+Customization.h"

@implementation UITextField (Customization)
-(void) configureBorders{
    self.layer.borderWidth = 1.5;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
}

-(void)setBorderColor: (UIColor*) color{
    self.layer.borderColor = color.CGColor;
}
@end
