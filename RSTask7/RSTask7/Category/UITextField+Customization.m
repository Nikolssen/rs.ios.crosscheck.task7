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


-(void)disable:(BOOL)shouldDisable{
    if (shouldDisable){
        self.enabled = NO;
        self.alpha = 0.5;
    }
    else {
        self.enabled = YES;
        self.alpha = 1.0;
    }
}
@end
