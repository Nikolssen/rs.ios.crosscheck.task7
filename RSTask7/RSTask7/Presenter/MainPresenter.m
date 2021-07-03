//
//  MainPresenter.m
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import "MainPresenter.h"
@interface MainPresenter()

@end
@implementation MainPresenter
-(void)checkLogin:(NSString*) login AndPassword:(NSString*) password{
    BOOL correctPassword = [password isEqualToString:@"password"];
    BOOL correctLogin = [login isEqualToString:@"username"];
    [self.view validateLogin:correctLogin];
    [self.view validatePassword:correctPassword];
    if (correctLogin && correctPassword){
        [self.view nextCheck];
    }
    
}
-(void)checkCode:(NSString*) code{
    [self.view valideCode: [code isEqualToString:@"132"]];
    
}
-(instancetype) initWithView:(id<MainView>)view{
    self = [super init];
    if (self) {
        _view = view;
    }
    return self;
}
@end
