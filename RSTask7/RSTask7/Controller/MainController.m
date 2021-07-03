//
//  MainController.m
//  RSTask7
//
//  Created by Admin on 03.07.2021.
//

#import "MainController.h"
#import "UITextField+Customization.h"
#import "UIColor+TaskColors.h"
@interface MainController ()
@property (strong, nonatomic) IBOutlet UITextField *loginTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginTextField configureBorders];
    [self.passwordTextField configureBorders];
    [self.loginTextField setBorderColor:[UIColor blackCoralColor]];
    [self.passwordTextField setBorderColor:[UIColor blackCoralColor]];
}

@end
