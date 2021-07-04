//
//  TextField.h
//  RSTask7
//
//  Created by Admin on 04.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextField : UITextField
typedef  NS_ENUM(NSUInteger, TextFieldState) {
    TextFieldStateDefault,
    TextFieldStateCorrect,
    TextFieldStateError,
    TextFieldStateInactive,
};
@property (nonatomic, assign) TextFieldState fieldState;
@end

NS_ASSUME_NONNULL_END
