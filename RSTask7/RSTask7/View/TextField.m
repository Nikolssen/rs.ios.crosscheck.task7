//
//  TextField.m
//  RSTask7
//
//  Created by Admin on 04.07.2021.
//

#import "TextField.h"
#import "UIColor+TaskColors.h"
@implementation TextField

-(void)awakeFromNib{
    [super awakeFromNib];
    [self configureUI];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self configureUI];
    }
    return self;
}

- (void) configureUI{
    self.layer.borderWidth = 1.5;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    self.fieldState = TextFieldStateDefault;
}

- (void)setFieldState:(TextFieldState)fieldState{
    switch (fieldState) {
        case TextFieldStateDefault:
            if (!self.enabled){
                self.enabled = YES;
                self.alpha = 1.0;
                self.text = @"";
            }
            else{
                self.text = @"";
            }
            self.layer.borderColor =[UIColor blackCoral].CGColor;
            _fieldState = TextFieldStateDefault;
            break;
        case TextFieldStateError:
            self.layer.borderColor = [UIColor venetianRed].CGColor;
            _fieldState = TextFieldStateError;
            break;
        case TextFieldStateCorrect:
            self.layer.borderColor = [UIColor turquioseGreen].CGColor;
            _fieldState = TextFieldStateCorrect;
            
            break;
        case TextFieldStateInactive:
            self.enabled = NO;
            self.alpha = 0.5;
            
            break;
    }
    
}


@end
