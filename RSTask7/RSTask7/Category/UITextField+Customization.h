//
//  UITextField+Customization.h
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Customization)
-(void) configureBorders;
-(void) setBorderColor: (UIColor*) color;
-(void) disable:(BOOL)shouldDisable;
@end

NS_ASSUME_NONNULL_END
