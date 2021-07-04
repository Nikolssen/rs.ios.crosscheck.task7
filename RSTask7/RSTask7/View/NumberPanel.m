//
//  NumberPanel.m
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import "NumberPanel.h"
#import "NumberButton.h"
#import "UIColor+TaskColors.h"
@interface NumberPanel()
@property (nonatomic, strong) NSArray<NumberButton*>* buttons;
@property (nonatomic, strong) UILabel* codeLabel;
@property (nonatomic, copy) NSMutableString* string;
@end

@implementation NumberPanel

- (void)awakeFromNib{
    [super awakeFromNib];
    self.layer.cornerRadius = 10.0;
    self.layer.borderWidth = 2.0;
    NumberButton* button1 = [[NumberButton alloc] init];
    [button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    NumberButton* button2 = [[NumberButton alloc] init];
    NumberButton* button3 = [[NumberButton alloc] init];
    self.buttons = @[button1, button2, button3];
    
}

- (void) setState:(NumberPanelState)state{
    if (state == NumberPanelStateHidden){
        self.hidden = YES;
        return;
    }
    self.hidden = NO;
    if (state == NumberPanelStateInactive){
        self.codeLabel.text = @"";
        self.string = [NSMutableString new];;
        self.layer.borderWidth = 0;
        return;
    }
    self.layer.borderWidth = 2;
    if (state == NumberPanelStateCorrect){
        self.layer.borderColor = [UIColor turquioseGreen].CGColor;
        
    }
    if (state == NumberPanelStateError){
        self.layer.borderColor = [UIColor venetianRed].CGColor;
    }

    
}

-(void)buttonPressed:(UIButton*) sender{
    if (self.string.length == 4){
        if (self.delegate){
            [self.delegate proceedSequence:self.string];
        }
        return;
    }
    for (NSUInteger i = 0; i<self.buttons.count; i++){
        if ([self.buttons objectAtIndex:i] == sender) {
            [self.string appendFormat:@"%lu",i+1];
            self.codeLabel.text = self.string;
            if (self.string.length == 4) {
                if (self.delegate){
                    [self.delegate proceedSequence:self.string];
                }
            }
        }
    }
}
@end
