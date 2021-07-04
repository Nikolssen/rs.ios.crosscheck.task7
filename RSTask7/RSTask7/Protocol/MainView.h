//
//  MainView.h
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainView <NSObject>
-(void) invalidateLogin;
-(void) invalidatePassword;
-(void) valideCode:(BOOL) isValide;
-(void) nextCheck;
@end

NS_ASSUME_NONNULL_END
