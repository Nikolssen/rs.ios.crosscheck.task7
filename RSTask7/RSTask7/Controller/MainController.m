//
//  MainController.m
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import "MainController.h"
#import "UITextField+Customization.h"
#import "UIColor+TaskColors.h"
#import "MainView.h"
#import "NumberButton.h"
#import "NumberPanel.h"
#import "AuthorizationButton.h"

@interface MainController () <UITextFieldDelegate, NumberPanelDelegate>
@property (strong, nonatomic) IBOutlet UITextField *loginTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
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
    [self.loginTextField configureBorders];
    [self.passwordTextField configureBorders];
    [self.loginTextField setBorderColor:[UIColor blackCoral]];
    [self.passwordTextField setBorderColor:[UIColor blackCoral]];
    self.numberPanel.state = NumberPanelStateHidden;
}

- (void) hideWhenTappedAround{
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}
-(void)hide{
    [self.view endEditing:true];
}
- (void)validateLogin:(BOOL)isValide {
    if (isValide) {
        [self.loginTextField setBorderColor:[UIColor turquioseGreen]];
    }
    else {
        [self.loginTextField setBorderColor:[UIColor venetianRed]];
    }
}

- (void)validatePassword:(BOOL)isValide {
    if (isValide) {
        [self.passwordTextField setBorderColor:[UIColor turquioseGreen]];
    }
    else {
        [self.passwordTextField setBorderColor:[UIColor venetianRed]];
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
    [self.passwordTextField disable:YES];
    [self.loginTextField disable:YES];
    self.authorizationButton.enabled = NO;
    self.numberPanel.state = NumberPanelStateInactive;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
- (IBAction)authorize:(UIButton *)sender {
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
        [weakSelf.passwordTextField disable:NO];
        [weakSelf.loginTextField disable:NO];
        weakSelf.authorizationButton.enabled = YES;
        weakSelf.numberPanel.state = NumberPanelStateHidden;
        [weakSelf.loginTextField setBorderColor:[UIColor blackCoral]];
        [weakSelf.passwordTextField setBorderColor:[UIColor blackCoral]];
    }];
    [alertController addAction:refreshAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
