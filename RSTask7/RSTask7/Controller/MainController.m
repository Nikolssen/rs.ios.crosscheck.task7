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
@interface MainController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *loginTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIView *indicatorView;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self confugureUI];
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
}


- (void) confugureUI{
    [self.loginTextField configureBorders];
    [self.passwordTextField configureBorders];
    [self.loginTextField setBorderColor:[UIColor blackCoral]];
    [self.passwordTextField setBorderColor:[UIColor blackCoral]];
    self.indicatorView.layer.cornerRadius = 10.0;
    self.indicatorView.layer.borderWidth = 2.0;
    self.indicatorView.hidden = YES;
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
        self.indicatorView.layer.borderColor = [UIColor turquioseGreen].CGColor;
    }
    else
    {
        self.indicatorView.layer.borderColor = [UIColor venetianRed].CGColor;
    }
}

- (void)nextCheck {
    [self.passwordTextField disable:YES];
    [self.loginTextField disable:YES];
    self.indicatorView.hidden = NO;
    self.indicatorView.layer.borderColor = [UIColor turquioseGreen].CGColor;
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


@end
