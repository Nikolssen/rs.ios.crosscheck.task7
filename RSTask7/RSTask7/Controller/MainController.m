//
//  MainController.m
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import "MainController.h"
#import "TextField.h"
#import "UIColor+TaskColors.h"
#import "MainView.h"
#import "NumberButton.h"
#import "NumberPanel.h"
#import "AuthorizationButton.h"

@interface MainController () <UITextFieldDelegate, NumberPanelDelegate>
@property (strong, nonatomic) IBOutlet TextField *loginTextField;
@property (strong, nonatomic) IBOutlet TextField *passwordTextField;
@property (strong, nonatomic) IBOutlet NumberPanel *numberPanel;
@property (strong, nonatomic) IBOutlet AuthorizationButton *authorizationButton;


@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self confugureUI];
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.numberPanel.delegate = self;
    [self hideWhenTappedAround];
}

- (void) confugureUI{
    self.loginTextField.fieldState = TextFieldStateDefault;
    self.passwordTextField.fieldState = TextFieldStateDefault;
    self.numberPanel.state = NumberPanelStateHidden;
}

- (void) hideWhenTappedAround{
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}
-(void)hide{
    [self.view endEditing:true];
}
- (void)validateLogin:(BOOL) isValide; {
    if (isValide) {
        self.loginTextField.fieldState = TextFieldStateCorrect;
    }
    else {
        self.loginTextField.fieldState = TextFieldStateError;
    }
    
}

- (void)validatePassword:(BOOL) isValide;{
    if (isValide) {
        self.passwordTextField.fieldState = TextFieldStateCorrect;
    }
    else {
        self.passwordTextField.fieldState = TextFieldStateError;
    }
    
    }


- (void)valideCode:(BOOL)isValide {
    if (isValide) {
        self.numberPanel.state = NumberPanelStateCorrect;
        [self showModal];
    }
    else
    {
        self.numberPanel.state = NumberPanelStateError;
    }
}

- (void)nextCheck {
    self.loginTextField.fieldState = TextFieldStateCorrect;
    self.passwordTextField.fieldState = TextFieldStateCorrect;
    self.loginTextField.fieldState = TextFieldStateInactive;
    self.passwordTextField.fieldState = TextFieldStateInactive;
    self.authorizationButton.enabled = NO;
    self.numberPanel.state = NumberPanelStateInactive;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    TextField* field = (TextField*)textField;
    if (field.fieldState == TextFieldStateError){
        field.fieldState = TextFieldStateDefault;
    }
}
- (IBAction)authorize:(UIButton *)sender {
    [self.view endEditing:YES];
    NSString* login = self.loginTextField.text;
    NSString* password = self.passwordTextField.text;
    [self.presenter checkLogin:login AndPassword:password];
}

- (void)proceedSequence:(nonnull NSString *)sequence {
    [self.presenter checkCode:sequence];
}

- (void)showModal{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfully authorized" preferredStyle:UIAlertControllerStyleAlert];

    __weak typeof(self) weakSelf = self;
    UIAlertAction* refreshAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        weakSelf.passwordTextField.fieldState = TextFieldStateDefault;
        weakSelf.loginTextField.fieldState = TextFieldStateDefault;
        weakSelf.authorizationButton.enabled = YES;
        weakSelf.numberPanel.state = NumberPanelStateHidden;
    }];
    [alertController addAction:refreshAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
