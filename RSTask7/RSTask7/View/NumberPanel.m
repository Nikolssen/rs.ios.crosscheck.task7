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
@property (nonatomic, strong) NSMutableString* string;
@property (nonatomic, strong) UIStackView* buttonStack;
@end

@implementation NumberPanel

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupViews];
    self.state = NumberPanelStateInactive;
    
}

- (void)setupViews{
    self.layer.cornerRadius = 10.0;
    self.layer.borderWidth = 2.0;
    NumberButton* button1 = [[NumberButton alloc] init];
    NumberButton* button2 = [[NumberButton alloc] init];
    NumberButton* button3 = [[NumberButton alloc] init];
    
    [button1 setTitle:@"1" forState:UIControlStateNormal];
    [button2 setTitle:@"2" forState:UIControlStateNormal];
    [button3 setTitle:@"3" forState:UIControlStateNormal];
    
    [button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttons = @[button1, button2, button3];

    
    self.buttonStack = [[UIStackView alloc] initWithArrangedSubviews:self.buttons];
    self.buttonStack.axis = UILayoutConstraintAxisHorizontal;
    self.buttonStack.distribution = UIStackViewDistributionFillEqually;
    self.buttonStack.alignment = UIStackViewAlignmentFill;
    self.buttonStack.spacing = 20;
   
    self.codeLabel = [[UILabel alloc]init];
    self.codeLabel.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightSemibold];
    [self addSubview:self.codeLabel];
    [self addSubview:self.buttonStack];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonStack.translatesAutoresizingMaskIntoConstraints = NO;
    self.codeLabel.translatesAutoresizingMaskIntoConstraints = NO;

    
}
- (void)layoutSubviews{
    [super layoutSubviews];

    [NSLayoutConstraint activateConstraints:@[ [self.buttonStack.centerXAnchor constraintEqualToAnchor:self.centerXAnchor], [self.buttonStack.widthAnchor constraintEqualToConstant:190], [self.buttonStack.heightAnchor constraintEqualToConstant:50.0], [self.codeLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:15], [self.buttonStack.topAnchor constraintEqualToAnchor:self.topAnchor constant:45], [self.codeLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor]]];
    
}

- (void) setState:(NumberPanelState)state{
    if (state == NumberPanelStateHidden){
        self.codeLabel.text = @"_";
        self.string = [NSMutableString new];
        self.hidden = YES;
        return;
    }
    self.hidden = NO;
    if (state == NumberPanelStateInactive){
 
        self.layer.borderWidth = 0;
        return;
    }
    self.layer.borderWidth = 2;
    if (state == NumberPanelStateCorrect){
        self.layer.borderColor = [UIColor turquioseGreen].CGColor;
        
    }
    if (state == NumberPanelStateError){
        self.layer.borderColor = [UIColor venetianRed].CGColor;
        self.codeLabel.text = @"_";
        self.string = [NSMutableString new];
    }
}

-(void)buttonPressed:(UIButton*) sender{
    if (self.string.length == 3){
        if (self.delegate){
            [self.delegate proceedSequence:self.string];
        }
        return;
    }
    for (NSUInteger i = 0; i<self.buttons.count; i++){
        if ([self.buttons objectAtIndex:i] == sender) {
            [self.string appendFormat:@"%lu",i+1];
            self.codeLabel.text = self.string;
            if (self.string.length == 3) {
                if (self.delegate){
                    [self.delegate proceedSequence:self.string];
                }
            }
        }
    }
}
@end
