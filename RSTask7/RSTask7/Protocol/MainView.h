//
//  MainView.h
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainView <NSObject>
-(void) validateLogin:(BOOL) isValide;
-(void) validatePassword: (BOOL) isValide;
-(void) valideCode:(BOOL) isValide;
-(void) 
@end

NS_ASSUME_NONNULL_END
